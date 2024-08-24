import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          foregroundColor: GlobalVariables.backgroundColor,
          backgroundColor: GlobalVariables.secondaryColor,
          minimumSize: const Size(double.infinity, 50)),
    );
  }
}
