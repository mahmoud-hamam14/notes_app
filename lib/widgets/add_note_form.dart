import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_bottom.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  // Create a GlobalKey to identify the form and access its state. This is necessary for form validation and other form-related operations.

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // Initialize the autovalidateMode variable to AutovalidateMode.disabled. This is used to control when the form should automatically validate its fields.

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),

          CustomTextField(
            onSaved: (value) {
              title = value;
            },

            hintText: 'title',
          ),

          const SizedBox(height: 16),

          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },

            hintText: 'subtitle',
            maxLines: 5,
          ),

          const SizedBox(height: 32),

          CustomBottom(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                // If the form is valid, save the form state. This will trigger the onSaved callbacks for each form field, allowing you to capture the input values.
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
                // If the form is not valid, set the autovalidateMode to AutovalidateMode.always and call setState to trigger a rebuild of the widget. This will cause the form to automatically validate its fields and display any validation errors.
              }
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
