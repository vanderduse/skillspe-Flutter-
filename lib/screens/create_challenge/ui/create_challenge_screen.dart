import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/create_challenge/bloc/create_challenge_bloc.dart';
import 'package:skills_pe/screens/create_challenge/models/create_challenge_request.dart';
import 'package:skills_pe/screens/create_challenge/repository/create_challenge_repository.dart';
import 'package:skills_pe/sharedWidgets/appBars/app_bar_widget.dart';
import 'package:skills_pe/sharedWidgets/buttons/filter_buttons.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/screens/create_challenge/ui/text_form_field_widget.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/utility/utility.dart';

class CreateChallengeScreen extends StatefulWidget {
  const CreateChallengeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreateChallengeState();
}

class _CreateChallengeState extends State<CreateChallengeScreen> {
  int _challengeFees = 5;
  int a = 1;
  List<String> filterButtonNames = [
    "₹10",
    "₹100",
    "₹200",
    "₹500",
    "₹700",
    "₹1000"
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(title: CREATECHALLENGE),
        body: challengeForm());
  }

  Widget challengeForm() {
    String selectedEndDate = "";
    final CreateChallengeBloc createChallengeBloc =
        CreateChallengeBloc(CreateChallengeRepository());
    CreateChallengeRequest createChallengeRequest = CreateChallengeRequest();
    return BlocConsumer(
      bloc: createChallengeBloc,
      listener: (BuildContext context, Object? state) {
        if (state is CreateChallengeLoadingState) {
          buildShowDialog(context);
        } else if (state is CreateChallengeFailureState) {
          Navigator.of(context).pop();
          showSnackBar(context, (state).errorMessage);
        } else if (state is CreateChallengeSuccessState) {
          Navigator.of(context).pop();
          showSnackBar(context, (state).successMessage);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: TextFormFieldWidget(
                                  formLabel: ENTERCHALLENGENAME,
                                  placeholder: CHALLENGE_NAME,
                                  isRequiredField: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ENTER_CHALLENGE_NAME;
                                    } else {
                                      createChallengeRequest.title = value;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormFieldWidget(
                            formLabel: CHALLENGEEMOJI,
                            isRequiredField: true,
                            isEmojiField: true,
                            placeholder: PLACEHOLDER_EMOJI,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ENTER_CHALLENGE_EMOJI;
                              } else {
                                createChallengeRequest.challengeEmoji = value;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 0,
                          left: 0,
                          right: 60,
                          bottom: 10), // Adjust margins as needed
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            CHOOSE_EMOJI_TEXT,
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    TextFormFieldWidget(
                      formLabel: CHALLENGEGOAL,
                      isRequiredField: true,
                      maxLines: 3,
                      placeholder: PLACEHOLDER_GOALS,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ENTER_CHALLENGE_GOAL;
                        } else {
                          createChallengeRequest.description = value;
                        }
                        return null;
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10, left: 5, right: 0, bottom: 0),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ENTER_DATES_STAR,
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: TextFormFieldWidget(
                                  formLabel: '',
                                  showFormLabel: false,
                                  isRequiredField: true,
                                  placeholder: PLACEHOLDER_START_DATE,
                                  isDateField: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ENTER_START_DATE;
                                    } else if (value.isNotEmpty &&
                                        selectedEndDate.isNotEmpty == true) {
                                      if (dateComparision(
                                          date1: value,
                                          date2: selectedEndDate)) {
                                        return START_DATE_END_DATE_VALIDATION;
                                      }
                                    } else {
                                      createChallengeRequest.startTime =
                                          convertStringDateFormat(
                                              inputFormat:
                                                  DDMMYYYY_SLASH_FORMAT,
                                              outputFormat:
                                                  YYYYMMDD_DASH_FORMAT,
                                              dateToBeFormatted: value);
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: TextFormFieldWidget(
                            formLabel: '',
                            showFormLabel: false,
                            isRequiredField: true,
                            placeholder: PLACEHOLDER_END_DATE,
                            isDateField: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ENTER_END_DATE;
                              } else {
                                selectedEndDate = value;
                                createChallengeRequest.endTime =
                                    convertStringDateFormat(
                                        inputFormat: DDMMYYYY_SLASH_FORMAT,
                                        outputFormat: YYYYMMDD_DASH_FORMAT,
                                        dateToBeFormatted: value);
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    TextFormFieldWidget(
                      formLabel: CHALLENGEFEES,
                      isRequiredField: true,
                      placeholder: FIVRUPEEMIN,
                      isAmountTypeField: true,
                      challengeFees: _challengeFees,
                      onChange: (value) {
                        setState(() {
                          _challengeFees = int.parse(value);
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ENTER_CHALLENGE_FEES;
                        } else if (value.isNotEmpty &&
                            int.parse(value) > 1000) {
                          return CHALLENGE_FEES_MAX_VALIDATION;
                        } else if (value.isNotEmpty && int.parse(value) < 5) {
                          return CHALLENGE_FEES_MIN_VALIDATION;
                        } else {
                          createChallengeRequest.participationFee =
                              int.parse(value);
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ButtonGroup(
                buttonNames: filterButtonNames,
                onItemSelected: (index) {},
              ),
            ),
            // Column(
            //   children: [
            //     Slider(
            //       value: _challengeFees > 1000
            //           ? 1000
            //           : _challengeFees < 5
            //               ? 5
            //               : _challengeFees.toDouble(),
            //       onChanged: (value) {
            //         setState(() {
            //           _challengeFees = value.round();
            //         });
            //       },
            //       min: 5,
            //       max: 1000,
            //     ),
            //     Container(
            //       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //       child: const Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             FIVRUPEEMIN,
            //             style: TextStyle(
            //                 fontSize: 11,
            //                 color: Color.fromARGB(253, 131, 125, 125)),
            //           ),
            //           Text(
            //             THOUSANDRUPEEMAX,
            //             style: TextStyle(
            //                 fontSize: 11,
            //                 color: Color.fromARGB(253, 131, 125, 125)),
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    createChallengeBloc.add(CreateChallengeButtonClickedEvent(
                        createChallengeRequest));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the value to control the roundness
                  ),
                ),
                child: const Center(
                  child: Text(
                    CREATECHALLENGE,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ));
      },
    );
  }
}
