import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.blueAccent,
        onPressed: () {},
        child: const Icon(Icons.add, size: 24, color: Colors.white),
      ),

      body: const NotesViewBody(),
    );
  }
}
