import 'package:flutter/material.dart';
import 'package:wordsmith/new_card.dart';
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
            onPressed: () {},
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewCard(context),
        //{ Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const NewCard()),
        // );}

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
