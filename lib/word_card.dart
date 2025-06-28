import 'package:flutter/material.dart';

enum SelectedColor { red, green, orange }

class WordCard extends StatefulWidget {
  final String title;
  final String discription;
  final VoidCallback onDelete;
  const WordCard(
      {super.key,
      required this.title,
      required this.discription,
      required this.onDelete});

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  SelectedColor selectedColor = SelectedColor.red; // default

  void onGreen() {
    setState(() {
      selectedColor = SelectedColor.green;
    });
  }

  void onOrange() {
    setState(() {
      selectedColor = SelectedColor.orange;
    });
  }

  void onRed() {
    setState(() {
      selectedColor = SelectedColor.red;
    });
  }

  Color get currentColor {
    switch (selectedColor) {
      case SelectedColor.green:
        return const Color.fromARGB(255, 60, 158, 63);
      case SelectedColor.orange:
        return Colors.orange;
      case SelectedColor.red:
        return const Color.fromARGB(255, 255, 0, 1);
      default:
        return const Color.fromARGB(255, 255, 0, 1); // default red
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Card(
          shadowColor: currentColor,
          elevation: 10,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
          color: Colors.white,
          child: IntrinsicHeight(
            child: Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: currentColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.discription,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: widget.onDelete,
              ),
              SizedBox(
                width: 40,
                child: Column(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: onGreen,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 60, 158, 63),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(8)),
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                            onTap: onOrange,
                            child: Container(color: Colors.orange))),
                    Expanded(
                        child: GestureDetector(
                      onTap: onRed,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8)),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
