import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter(); // Initialize Hive for Flutter. This is necessary before using Hive to store data in the app.

  await Hive.openBox(
    kNotesBox,
  ); // Open the Hive box named 'notes_box'. This is necessary to access the data stored in this box.

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const NotesView(),
    );
  }
}
