import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TransparentTextButton extends TextSpan {
  final VoidCallback onPressed;
  final String label;
  final Color? textColor;

  TransparentTextButton({
    required this.onPressed,
    required this.label,
    this.textColor,
  }) : super(
          text: label,
          style: TextStyle(
            fontSize: 14,
            color: textColor ?? Colors.blue, // Default or custom text color
          ),
          recognizer: TapGestureRecognizer()..onTap = onPressed,
        );
}
