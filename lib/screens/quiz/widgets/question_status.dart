import 'package:flutter/material.dart';

class QuestionStatus extends StatefulWidget {
  final int totalQuestions;
  final int currentQuestionIndex;

  const QuestionStatus({
    Key? key,
    required this.totalQuestions,
    required this.currentQuestionIndex,
  }) : super(key: key);

  @override
  _QuestionStatusState createState() => _QuestionStatusState();
}

class _QuestionStatusState extends State<QuestionStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Text(
            '${widget.currentQuestionIndex}/${widget.totalQuestions}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
