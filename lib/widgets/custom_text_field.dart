import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
  });

  final String hintText;

  final int maxLines;

  final void Function(String?)?
  onSaved; // Define an optional onSaved callback that takes a String? parameter. This allows the parent widget to handle the saving of the text field's value when the form is saved.

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved:
          onSaved, // Set the onSaved callback to the onSaved parameter passed to the CustomTextField. This allows the parent widget to handle the saving of the text field's value when the form is saved.

      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        } else {
          return null;
        }
      }, // Add a validator function to the TextFormField. This function checks if the value is null or empty, and if so, returns an error message. Otherwise, it returns null, indicating that the input is valid.

      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color ?? Colors.white),
    );
  }
}
