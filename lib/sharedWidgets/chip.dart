import 'package:flutter/material.dart';

class TextChip extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const TextChip({
    Key? key,
    required this.text,
    this.backgroundColor = const Color(0xffF5F5F5),
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
