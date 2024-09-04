import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton(
      {super.key, required this.text, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          foregroundColor: GlobalVariables.backgroundColor,
          backgroundColor:
              color == null ? GlobalVariables.secondaryColor : color,
          minimumSize: const Size(double.infinity, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
      child: Text(
        text,
      ),
    );
  }
}
