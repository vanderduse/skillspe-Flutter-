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
        border: Border.all(
            width: 1.1, color: const Color(0xFF8C50F6)), // Border color
      ),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: InkWell(
          onTap: onPressed,
          child: Text(
            label,
            style: const TextStyle(color: Color(0xFF8C50F6)),
          )),
    );
  }
}
