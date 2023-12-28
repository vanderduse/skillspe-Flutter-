import 'package:flutter/material.dart';

class QuizStatus extends StatelessWidget {
  final String status;

  const QuizStatus({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFB465DA),
                Color(0xFFCF6CC9),
                Color(0xFFEE609C),
              ],
              stops: [0.33, 0.66, 1.0],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            status,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
