import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skills_pe/screens/create_challenge/bloc/create_challenge_bloc.dart';
import 'package:skills_pe/screens/create_challenge/models/create_challenge_request.dart';
import 'package:skills_pe/sharedWidgets/app_bar_widget.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/screens/create_challenge/ui/text_form_field_widget.dart';
import 'package:skills_pe/utility/utility.dart';

class CreateChallengeScreen extends StatefulWidget {
  const CreateChallengeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreateChallengeState();
}

class _CreateChallengeState extends State<CreateChallengeScreen> {
  int _challengeFees = 5;
  int a = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(title: createChallenge),
        body: challengeForm());
  }

  Widget challengeForm() {
    final CreateChallengeBloc createChallengeBloc = CreateChallengeBloc();
    CreateChallengeRequest createChallengeRequest = CreateChallengeRequest();
    return BlocConsumer(
      bloc: createChallengeBloc,
      listener: (BuildContext context, Object? state) {
        if (state is CreateChallengeLoadingState) {
          buildShowDialog(context);
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
                    TextFormFieldWidget(
                      formLabel: challengeName,
                      isRequiredField: true,
                      onChange: (value) {
                        createChallengeRequest.challengeName = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter challenge name";
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      formLabel: challengeGoal,
                      isRequiredField: true,
                      maxLines: 3,
                      onChange: (value) {
                        createChallengeRequest.challengeGoal = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter challenge goal";
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      formLabel: challengeEmoji,
                      isRequiredField: false,
                      onChange: (value) {
                        createChallengeRequest.challengeEmoji = value;
                      },
                    ),
                    TextFormFieldWidget(
                      formLabel: startDate,
                      isRequiredField: true,
                      isDateField: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter start date";
                        } else if (value.isNotEmpty &&
                            createChallengeRequest.endDate.isNotEmpty) {
                          DateTime startDate =
                              DateFormat('dd/MM/yyyy').parse(value);
                          DateTime endDate = DateFormat('dd/MM/yyyy')
                              .parse(createChallengeRequest.endDate);
                          if (startDate.isAfter(endDate)) {
                            return "Start date cannot be greater than end date";
                          }
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      formLabel: endDate,
                      isRequiredField: true,
                      isDateField: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter end date";
                        } else {
                          createChallengeRequest.endDate = value;
                        }
                        return null;
                      },
                    ),
                    TextFormFieldWidget(
                      formLabel: challengeFees,
                      isRequiredField: true,
                      isAmountTypeField: true,
                      challengeFees: _challengeFees,
                      onChange: (value) {
                        setState(() {
                          _challengeFees = int.parse(value);
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter challenge fees";
                        } else if (value.isNotEmpty &&
                            int.parse(value) > 1000) {
                          return "Challenge fees cannot be greater than 1000";
                        } else if (value.isNotEmpty && int.parse(value) < 5) {
                          return "Challenge fees cannot be less than 5";
                        } else {
                          createChallengeRequest.challengeFees =
                              int.parse(value);
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Slider(
                  value: _challengeFees > 1000
                      ? 1000
                      : _challengeFees < 5
                          ? 5
                          : _challengeFees.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _challengeFees = value.round();
                    });
                  },
                  min: 5,
                  max: 1000,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        fiveRupeesMin,
                        style: TextStyle(
                            fontSize: 11,
                            color: Color.fromARGB(253, 131, 125, 125)),
                      ),
                      Text(
                        thousandRupeesMin,
                        style: TextStyle(
                            fontSize: 11,
                            color: Color.fromARGB(253, 131, 125, 125)),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
                    createChallenge,
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
