import 'package:flutter/material.dart';
import 'package:skills_pe/screens/quiz/widgets/answer_option_btn.dart';
import 'package:skills_pe/models/question_model.dart';

class OptionsContainer extends StatefulWidget {
  final Question question;

  const OptionsContainer({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  _OptionsContainerState createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
  int? selectedOptionIndex; // Use int? to allow for no selection

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
              isSelected: index == selectedOptionIndex,
              onPress: (int index) {
                setState(() {
                  // Update the selected option index on press
                  selectedOptionIndex = index;
                });
              },
            ));
      }).toList(),
    );
  }
}
