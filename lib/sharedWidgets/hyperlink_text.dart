import 'package:flutter/material.dart';

class HyperlinkText extends StatelessWidget {
  final String normalText;
  final String linkedText;
  final VoidCallback onPressed;
  final double? height;

  const HyperlinkText({
    Key? key,
    required this.normalText,
    this.linkedText = '',
    required this.onPressed,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$normalText ',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          if (linkedText.isNotEmpty)
            TextSpan(
              text: linkedText,
              style: const TextStyle(
                color: Color(0xFF7E56DA), // Adjusted color for better contrast
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
              // recognizer: TapAndPanGestureRecognizer()
              //   ..onTapUp = (TapDragUpDetails details) => {}
            ),
        ],
      ),
    );
  }
}
