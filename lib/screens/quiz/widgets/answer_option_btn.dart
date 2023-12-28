import 'package:flutter/material.dart';

class AnswerOutlineBtn extends StatelessWidget {
  final int index;
  final String answerText;
  final bool isSelected;
  final Function(int index) onPress;

  const AnswerOutlineBtn({
    Key? key,
    required this.index,
    required this.answerText,
    required this.isSelected,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(index), // Use the provided onPress callback on tap
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: isSelected ? 1.50 : 1,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : const Color(0xFFD0D1DA),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: ShapeDecoration(
                color: const Color(0xFFF5F5F5),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFFD0D1DA),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    String.fromCharCode('A'.codeUnitAt(0) + index),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                child: Text(
                  answerText,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
