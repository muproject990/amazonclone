import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  CustomTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        // obscureText: obscureText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please enter a $hintText';
        }
        return null;
      },
    );
  }
}
