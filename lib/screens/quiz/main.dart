import 'package:flutter/material.dart';
import 'package:skills_pe/screens/quiz/widgets/quiz_specs.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/alert_banner.dart';
import 'package:skills_pe/sharedWidgets/custom_checkbox.dart';
import 'package:skills_pe/sharedWidgets/hyperlink_text.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';
import 'package:skills_pe/screens/quiz/widgets/quiz_details_cards.dart';
import 'package:skills_pe/utility/constants.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  void handleCheckboxChange(bool value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithBack(
        screenName: 'Challenges',
        walletAmount: 100.00,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: const AlertBanner(
                    alertMessage: "Quiz related upadtes will come here"),
              ),
              const QuizDetailContainer(
                bannerImageUrl:
                    "https://i.postimg.cc/L63LVRnT/Rectangle-57.png",
                title: "Indian History",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Ut enim ac etiam sed malesuada consequat venenatis.",
                status: "LIVE",
              ),
              const QuizSpecs(
                duration: "10 Mins",
                totalQuestions: 20,
                prizeAmount: 500.00,
              )
            ],
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomCheckbox(checked: true, onChanged: () => {}),
                      HyperlinkText(
                          normalText: ACCEPT_QUIZ,
                          linkedText: QUIZ_TNC,
                          onPressed: () => {})
                    ],
                  ),
                  FilledBtn(
                      label: "$START_QUIZ \$3",
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
