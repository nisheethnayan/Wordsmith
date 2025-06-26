import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Card(
          shadowColor: const Color.fromRGBO(213, 13, 13, 1),
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
                        style: Theme.of(context).textTheme.bodyLarge,
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
                        child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.green, // background color
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8)), // round all edges
                      ),
                    )),
                    Expanded(child: Container(color: Colors.orange)),
                    Expanded(
                        child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red, // background color
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8)), // round all edges
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
