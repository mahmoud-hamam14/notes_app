import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter(); // Initialize Hive for Flutter. This is necessary before using Hive to store data in the app.

  Bloc.observer =
      SimpleBlocObserver(); // Set the Bloc observer to an instance of SimpleBlocObserver. This allows you to observe and log the behavior of Blocs and Cubits in the app, such as state changes and events.

  await Hive.openBox(
    kNotesBox,
  ); // Open the Hive box named 'notes_box'. This is necessary to access the data stored in this box.

  Hive.registerAdapter(
    NoteModelAdapter(),
  ); // Register the NoteModelAdapter with Hive. This is necessary to allow Hive to serialize and deserialize NoteModel objects when storing and retrieving data from the 'notes_box'.

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Use MultiBlocProvider to provide multiple Bloc or Cubit instances to the widget tree. In this case, we are providing an instance of AddNoteCubit.
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
      ], // Provide an instance of AddNoteCubit to the widget tree. This allows any widget in the tree to access the AddNoteCubit instance and its state.
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: const NotesView(),
      ),
    );
  }
}
