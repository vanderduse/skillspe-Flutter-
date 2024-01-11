import 'package:flutter/material.dart';

class ClickableCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget childWidget;
  final VoidCallback? onPressed;

  const ClickableCard(
      {super.key,
      required this.backgroundColor,
      required this.childWidget,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.all(16),
        side: BorderSide(
          color: backgroundColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: childWidget,
    );
  }
}
