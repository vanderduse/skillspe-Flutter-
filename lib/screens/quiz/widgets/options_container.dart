import 'package:flutter/material.dart';
import 'package:skills_pe/screens/quiz/widgets/answer_option_btn.dart';
import 'package:skills_pe/models/question_model.dart';

// ignore: must_be_immutable
class OptionsContainer extends StatefulWidget {
  final Question question;
  final Function(String) selectedAnswer;
  int selectedOptionIndex;

  OptionsContainer(
      {Key? key,
      required this.question,
      required this.selectedOptionIndex,
      required this.selectedAnswer})
      : super(key: key);

  @override
  _OptionsContainerState createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.question.options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;

        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: AnswerOutlineBtn(
              index: index,
              answerText: option,
              isSelected: index == widget.selectedOptionIndex,
              onPress: (int index) {
                setState(() {
                  // Update the selected option index on press
                  widget.selectedOptionIndex = index;
                  widget.selectedAnswer.call(widget.question.options[index]);
                });
              },
            ));
      }).toList(),
    );
  }
}
