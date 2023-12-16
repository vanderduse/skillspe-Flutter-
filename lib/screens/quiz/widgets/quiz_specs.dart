import 'package:flutter/material.dart';
import 'package:skills_pe/screens/quiz/widgets/quiz_spec.dart';

class QuizSpecs extends StatelessWidget {
  final int totalQuestions;
  final String duration;
  final double prizeAmount;
  const QuizSpecs(
      {Key? key,
      required this.totalQuestions,
      required this.duration,
      required this.prizeAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuizSpec(
              label: "Questions",
              icon: "assets/illustrations/message-question.svg",
              value: "20"),
          Spacer(),
          QuizSpec(
              label: "Duration",
              icon: "assets/illustrations/time.svg",
              value: "10 mins"),
          Spacer(),
          QuizSpec(
              label: "Prize Pool",
              icon: "assets/illustrations/medal-star.svg",
              value: "\$ 2000"),
        ],
      ),
    );
  }
}
