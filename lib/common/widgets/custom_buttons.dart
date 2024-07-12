import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          textStyle: const TextStyle(color: Colors.white),
          minimumSize: const Size(double.infinity, 50)),
      child: Text(text),
    );
  }
}
