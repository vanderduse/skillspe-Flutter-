import 'package:flutter/material.dart';

class ColoredOutlineButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onTap;

  const ColoredOutlineButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        decoration: ShapeDecoration(
          color: buttonColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: textColor),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 0.10,
          ),
        ),
      ),
    );
  }
}
