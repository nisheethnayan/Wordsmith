import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCard extends StatefulWidget {
  const NewCard({super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void _submitData() {
    final title = _titleController.text.trim();
    final description = _descController.text.trim();

    if (title.isEmpty || description.isEmpty) return;

    Navigator.of(context).pop({
      'title': title,
      'description': description,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Card',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.black,
              autofocus: true,
              controller: _titleController,
              textInputAction: TextInputAction.next,
              style: const TextStyle(
                  color: Colors.black), // Text color inside the field
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // Background color
                labelText: 'Word',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: const TextStyle(
                  color: Colors.grey, // Slightly grey label
                ),
                helperText: 'Type the word you just found out.',
                helperStyle:
                    const TextStyle(color: Color.fromARGB(255, 255, 236, 179)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Curved border
                  borderSide:
                      const BorderSide(color: Colors.white), // Border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey), // On focus
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              cursorColor: Colors.black,
              autofocus: true,
              controller: _descController,
              textInputAction: TextInputAction.done,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Description',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                helperText: 'Also add the meaning of the word.',
                helperStyle:
                    const TextStyle(color: Color.fromARGB(255, 255, 236, 179)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: _submitData,
              child: Text(
                'Add',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
