import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: labelText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
