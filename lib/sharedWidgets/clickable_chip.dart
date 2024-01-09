import 'package:flutter/material.dart';

class ClickableChip extends StatelessWidget {
  final Color textColor;
  final Color chipColor;
  final VoidCallback? onPressed;
  final String text;

  const ClickableChip({
    Key? key,
    required this.textColor,
    required this.chipColor,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderColor = chipColor;

    return GestureDetector(
      onTap: onPressed,
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(20),
        ),
        color: chipColor.withOpacity(0.6),
        child: Container(
          constraints: BoxConstraints(minWidth: 64),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
