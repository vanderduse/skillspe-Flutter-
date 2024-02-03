import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/quiz/bloc/quiz_bloc.dart';
import 'package:skills_pe/screens/quiz/quiz_question.dart';
import 'package:skills_pe/screens/quiz/repository/quiz_repository.dart';
import 'package:skills_pe/screens/quiz/widgets/quiz_specs.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/alert_banner.dart';
import 'package:skills_pe/sharedWidgets/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/custom_checkbox.dart';
import 'package:skills_pe/sharedWidgets/hyperlink_text.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';
import 'package:skills_pe/screens/quiz/widgets/quiz_details_cards.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/utility.dart';

class QuizHome extends StatefulWidget {
  final String quizId;
  const QuizHome({super.key, required this.quizId});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  final QuizBloc _quizBloc = QuizBloc(QuizRepository());
  bool? isConditionAccepted = true;
  @override
  void initState() {
    _quizBloc.add(QuizInitialEvent(widget.quizId));
    super.initState();
  }

  void handleCheckboxChange(bool value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithBack(
        screenName: 'Quiz',
        walletAmount: 100.00,
      ),
      body: BlocConsumer(
        bloc: _quizBloc,
        listenWhen: (previous, current) => current != previous,
        listener: (context, state) {
          if (state is QuizApiFailureState) {
            showSnackBar(context, state.errorMessage);
          }
        },
        buildWhen: (previous, current) => current != QuizApiFailureState,
        builder: (context, state) {
          if (state is QuizApiSuccessState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    QuizDetailContainer(
                      bannerImageUrl:
                          state.quizInformationResponseModel.banner!,
                      title: state.quizInformationResponseModel.name!,
                      description:
                          state.quizInformationResponseModel.description!,
                      status: "LIVE",
                    ),
                    QuizSpecs(
                      duration:
                          '${state.quizInformationResponseModel.duration!.toInt()} Mins',
                      totalQuestions:
                          state.quizInformationResponseModel.noOfQuestions!,
                      prizeAmount:
                          state.quizInformationResponseModel.pricePool!,
                    )
                  ],
                ),
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomCheckbox(
                              checked: isConditionAccepted!,
                              onChange: (value) {
                                setState(() {
                                  isConditionAccepted = value;
                                });
                              },
                            ),
                            HyperlinkText(
                                normalText: ACCEPT_QUIZ,
                                linkedText: QUIZ_TNC,
                                onPressed: () => {})
                          ],
                        ),
                        FilledBtn(
                            label: START_QUIZ,
                            isButtonEnabled: isConditionAccepted ?? false,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizQuestion(
                                        quizName: state
                                            .quizInformationResponseModel.name,
                                        quizId: widget.quizId,
                                        quizDuration: state
                                            .quizInformationResponseModel
                                            .duration)),
                              );
                            },
                            backgroundColor: Theme.of(context).primaryColor,
                            textColor: Colors.white),
                      ],
                    ))
              ],
            );
          } else if (state is QuizLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
