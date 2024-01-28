import 'package:flutter/material.dart';

class UnFilledBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const UnFilledBtn({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF8C50F6)), // Border color
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF8C50F6),
          ),
          child: Text(
            label,
          ),
        ));
  }
}
