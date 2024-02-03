import 'package:flutter/material.dart';
import 'package:skills_pe/screens/quiz/widgets/quiz_spec.dart';
import 'package:skills_pe/utility/constants.dart';

class QuizSpecs extends StatelessWidget {
  final int totalQuestions;
  final String duration;
  final int prizeAmount;
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuizSpec(
              label: QUESTIONS,
              icon: "assets/illustrations/message-question.svg",
              value: totalQuestions.toString()),
          const Spacer(),
          QuizSpec(
              label: DURATION,
              icon: "assets/illustrations/time.svg",
              value: duration),
          const Spacer(),
          QuizSpec(
              label: PRIZE_POOL,
              icon: "assets/illustrations/medal-star.svg",
              value: prizeAmount.toString()),
        ],
      ),
    );
  }
}
