import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = Colors.blue;

  addNote(NoteModel note) async {
    // ignore: deprecated_member_use
    note.color = color.value;
    // Define an asynchronous method named addNote that takes a NoteModel object as a parameter. This method will be responsible for adding a note to the Hive box and managing the state of the operation.
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(
        kNotesBox,
      ); // Get a reference to the Hive box that stores NoteModel objects. This is necessary to perform operations on the box, such as adding a new note.

      await notesBox.add(
        note,
      ); // Add the provided note to the Hive box. This is an asynchronous operation, so we await its completion. If the operation is successful, the note will be stored in the box and can be retrieved later.
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
