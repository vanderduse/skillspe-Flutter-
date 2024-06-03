import 'package:flutter/material.dart';

class FilledBtnWithIcon extends StatelessWidget {
  final String label;
  final IconData iconPath;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isButtonEnabled;

  const FilledBtnWithIcon(
      {Key? key,
      required this.label,
      required this.iconPath,
      required this.onPressed,
      required this.backgroundColor,
      required this.textColor,
      this.isButtonEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(
          iconPath,
          size: 25,
        ),
        iconAlignment: IconAlignment.end,
        label: Text(
          label,
          style: const TextStyle(
              fontFamily: "Inter", fontWeight: FontWeight.w700, fontSize: 16),
        ),
        onPressed: isButtonEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          textStyle: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
