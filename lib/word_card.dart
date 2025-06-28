import 'package:flutter/material.dart';

enum SelectedColor { red, green, orange }

class WordCard extends StatelessWidget {
  final String title;
  final String discription;
  final SelectedColor selectedColor;
  final VoidCallback onDelete;
  final Function(SelectedColor) onColorChanged;

  const WordCard({
    super.key,
    required this.title,
    required this.discription,
    required this.selectedColor,
    required this.onDelete,
    required this.onColorChanged,
  });

  Color get currentColor {
    switch (selectedColor) {
      case SelectedColor.green:
        return const Color.fromARGB(255, 60, 158, 63);
      case SelectedColor.orange:
        return Colors.orange;
      case SelectedColor.red:
      default:
        return const Color.fromARGB(255, 255, 0, 1);
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
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: currentColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        discription,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
              SizedBox(
                width: 40,
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onColorChanged(SelectedColor.green),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 60, 158, 63),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onColorChanged(SelectedColor.orange),
                        child: Container(color: Colors.orange),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onColorChanged(SelectedColor.red),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
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
