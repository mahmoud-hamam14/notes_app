import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            // if the new state is AddNoteSuccess, it will pop the current route from the navigation stack, effectively closing the bottom sheet.
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
            // if the new state is AddNoteFailure, it will print an error message to the console that includes the error message from the state. This allows you to see what went wrong when trying to add a note.
            if (state is AddNoteFailure) {
              print('failed to add note: ${state.errorMessage}');
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: // The inAsyncCall property of ModalProgressHUD is set to true when the state is AddNoteLoading, and false otherwise. This means that the loading indicator will be displayed when the state is AddNoteLoading, and hidden when the state is not AddNoteLoading.
                  state is AddNoteLoading ? true : false,

              child: const AddNoteForm(),
            );
          },
        ),
      ),
    );
  }
}
