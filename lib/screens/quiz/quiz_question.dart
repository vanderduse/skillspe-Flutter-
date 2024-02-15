import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/quiz/bloc/quiz_bloc.dart';
import 'package:skills_pe/screens/quiz/model/quiz_answer_set.dart';
import 'package:skills_pe/screens/quiz/model/quiz_questions_answer_model.dart';
import 'package:skills_pe/screens/quiz/repository/quiz_repository.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/show_progressDialog_with_message.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/sharedWidgets/cross_timer_appbar.dart';
import 'package:skills_pe/screens/quiz/widgets/timer_progress_bar.dart';
import 'package:skills_pe/screens/quiz/widgets/options_container.dart';
import 'package:skills_pe/models/question_model.dart';
import 'package:skills_pe/screens/quiz/widgets/question_status.dart';
import 'package:skills_pe/screens/quiz/widgets/question_detail.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/utility/utility.dart';

class QuizQuestion extends StatefulWidget {
  final String quizId;
  final double? quizDuration;
  final String? quizName;
  const QuizQuestion(
      {super.key,
      required this.quizName,
      required this.quizId,
      required this.quizDuration});

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  late QuizBloc _quizBloc;
  int questionNo = 1;
  bool isQuestionSetReady = false;
  var _selectedAnswer = "";
  final List<QuizAnswerSet> _quizAnswerSet = [];

  @override
  void initState() {
    _quizBloc = QuizBloc(QuizRepository());
    _quizBloc.add(QuizPlayEvent(widget.quizId));
    super.initState();
  }

  void _updateQuestionState() {
    setState(() {
      questionNo++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationWithTimer(
          context,
          widget.quizName,
          isQuestionSetReady
              ? convertMintuesToSeconds(widget.quizDuration)
              : null),
      backgroundColor: const Color(0xffF4F4F4),
      body: BlocConsumer(
        bloc: _quizBloc,
        listener: (context, state) {
          if (state is QuizPlayFailureState) {
            showSnackBar(context, state.errorMessage);
          }
          if (state is QuizPlaySuccessState) {
            setState(() {
              isQuestionSetReady = true;
            });
          }
          if (state is QuizSubmitSucessState) {
            Navigator.of(context).pop();
          }
        },
        buildWhen: (previous, current) => current != QuizApiFailureState,
        builder: (context, state) {
          if (state is QuizPlaySuccessState) {
            List<QuizQuestionAnswerSetModel>? questionAnswerSet =
                state.quizQuestionSet;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(0),
                        child: TimerProgressBar(
                          totalTimeInSeconds:
                              convertMintuesToSeconds(widget.quizDuration) ?? 0,
                          onCompletion: () {
                            _quizBloc.add(QuizSubmitEvent(
                                quizAnswerSetList: _quizAnswerSet,
                                quizId: widget.quizId));
                          },
                        )),
                    Builder(builder: (BuildContext context) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: QuestionStatus(
                                currentQuestionIndex: questionNo,
                                totalQuestions: questionAnswerSet?.length ?? 0),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: QuestionDetails(
                              question:
                                  questionAnswerSet?[questionNo - 1].question ??
                                      "",
                            ),
                          ),
                          OptionsContainer(
                            question: Question(
                              question: '',
                              options: questionAnswerSet![questionNo - 1]
                                  .getListFromString(),
                            ),
                            selectedAnswer: (answer) {
                              _selectedAnswer = answer;
                            },
                            selectedOptionIndex: -1,
                          )
                        ],
                      );
                    })
                  ],
                ),
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    width: double.infinity,
                    child: Column(
                      children: [
                        FilledBtn(
                            label: questionNo == questionAnswerSet?.length
                                ? SUBMIT
                                : NEXT,
                            onPressed: () {
                              QuizAnswerSet quizAnswerSet = QuizAnswerSet(
                                  answer: _selectedAnswer,
                                  id: questionAnswerSet![questionNo - 1].id!);
                              _quizAnswerSet.add(quizAnswerSet);
                              if (questionNo != questionAnswerSet.length) {
                                _updateQuestionState();
                              } else {
                                _quizBloc.add(QuizSubmitEvent(
                                    quizAnswerSetList: _quizAnswerSet,
                                    quizId: widget.quizId));
                              }
                            },
                            backgroundColor: Theme.of(context).primaryColor,
                            textColor: Colors.white),
                      ],
                    ))
              ],
            );
          } else if (state is QuizLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuizSubmitLoadingState) {
            return const ShowProgressDialogWithMessage(
                message: "Submitting Quiz...");
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
