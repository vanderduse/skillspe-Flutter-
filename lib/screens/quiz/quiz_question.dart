import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/sharedWidgets/cross_timer_appbar.dart';
import 'package:skills_pe/screens/quiz/widgets/timer_progress_bar.dart';
import 'package:skills_pe/screens/quiz/widgets/options_container.dart';
import 'package:skills_pe/models/question_model.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({super.key});

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationWithTimer("Quiz", 2000.00),
      backgroundColor: Color(0xffF4F4F4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.all(0),
                  child: const TimerProgressBar(totalTimeInSeconds: 20)),
              Container(
                margin: const EdgeInsets.all(20),
                child: const QuestionStatus(
                    currentQuestionIndex: 2, totalQuestions: 10),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const QuestionDetails(
                  question:
                      "Phenolphthalein Is A Synthetic Indicator And Its Colours In Acidic And Basic Solutions Respectively Are:",
                ),
              ),
              OptionsContainer(
                  question: Question(
                question: 'What is your favorite color?',
                options: ['Red', 'Blue', 'Green', 'Yellow'],
              ))
            ],
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              width: double.infinity,
              child: Column(
                children: [
                  FilledBtn(
                      label: SUBMIT_AND_NEXT,
                      onPressed: () {
                        print('Button tapped!');
                      },
                      backgroundColor: Theme.of(context).primaryColor,
                      textColor: Colors.white),
                ],
              ))
        ],
      ),
    );
  }
}

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
