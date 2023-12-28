import 'package:flutter/material.dart';

class QuestionDetails extends StatelessWidget {
  final String question;
  const QuestionDetails({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
