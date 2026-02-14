import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.blueAccent,
        onPressed: () {
          showModalBottomSheet(
            // Show the bottom sheet when the button is pressed
            shape: RoundedRectangleBorder(
              // Add rounded corners to the bottom sheet
              borderRadius: BorderRadius.circular(16),
            ),

            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add, size: 24, color: Colors.white),
      ),

      body: const NotesViewBody(),
    );
  }
}
