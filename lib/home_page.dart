import 'package:flutter/material.dart';
import 'package:wordsmith/new_card.dart';
import 'package:wordsmith/stats.dart';
import 'package:wordsmith/word_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> titles = [];
  List<String> descriptions = [];
  List<String> categories = [];
  List<SelectedColor> colors = [];

  int total = 0;
  int newWords = 0;
  int needRevision = 0;
  int mastered = 0;

  void _recalculateCounts() {
    newWords = colors.where((c) => c == SelectedColor.red).length;
    needRevision = colors.where((c) => c == SelectedColor.orange).length;
    mastered = colors.where((c) => c == SelectedColor.green).length;
  }

  void addNewCard(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewCard(),
      ),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        titles.add(result['title']!);
        descriptions.add(result['description']!);
        categories.add(result['category']!);
        total = titles.length;
        colors.add(SelectedColor.red);
        _recalculateCounts();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => Stats(
                    total: total,
                    newWords: newWords,
                    needRevision: needRevision,
                    mastered: mastered,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.query_stats,
              color: Colors.black,
            ),
            iconSize: 30,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return WordCard(
            title: titles[index],
            discription: descriptions[index],
            selectedColor: colors[index],
            onColorChanged: (newColor) {
              setState(() {
                colors[index] = newColor;
                _recalculateCounts();
              });
            },
            onDelete: () {
              setState(() {
                titles.removeAt(index);
                descriptions.removeAt(index);
                categories.removeAt(index);
                total = titles.length;
                colors.removeAt(index);
                _recalculateCounts();
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewCard(context),
        backgroundColor: Colors.black,
        child: const Icon(
          color: Colors.white,
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
