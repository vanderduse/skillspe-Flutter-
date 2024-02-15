import 'package:flutter/material.dart';

class FilledBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isButtonEnabled;

  const FilledBtn(
      {Key? key,
      required this.label,
      required this.onPressed,
      required this.backgroundColor,
      required this.textColor,
      this.isButtonEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isButtonEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          textStyle: Theme.of(context).textTheme.labelMedium,
        ),
        child: Text(label),
      ),
    );
  }
}
