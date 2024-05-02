import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/create_challenge/bloc/create_challenge_bloc.dart';
import 'package:skills_pe/screens/create_challenge/models/create_challenge_request.dart';
import 'package:skills_pe/screens/create_challenge/repository/create_challenge_repository.dart';
import 'package:skills_pe/screens/challenge_detail/ui/challenge_detail_screen.dart';
import 'package:skills_pe/screens/home_screens/model/list_private_challenges_response.dart';
import 'package:skills_pe/sharedWidgets/appBars/app_bar_widget.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/buttons/filter_buttons.dart';
import 'package:skills_pe/sharedWidgets/custom_checkbox.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/screens/create_challenge/ui/text_form_field_widget.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/utility/utility.dart';

class CreateChallengeScreen extends StatefulWidget {
  final bool isEdit;
  final PrivateChallengesListResponse? challengeDetail;
  const CreateChallengeScreen(
      {super.key, this.isEdit = false, this.challengeDetail});

  @override
  State<StatefulWidget> createState() => _CreateChallengeState();
}

class _CreateChallengeState extends State<CreateChallengeScreen> {
  bool isConditionAccepted = false;
  final TextEditingController feeFieldController = TextEditingController();
  String selectedEndDate = "";
  List<String> filterButtonNames = [
    "₹10",
    "₹100",
    "₹200",
    "₹500",
    "₹700",
    "₹1000"
  ];

  @override
  void initState() {
    feeFieldController.text = widget.isEdit
        ? widget.challengeDetail?.participationFee?.toInt().toString() ?? '10'
        : '10';
    selectedEndDate = widget.isEdit
        ? convertServerDate(
            widget.challengeDetail?.endTime, DDMMYYYY_SLASH_FORMAT)
        : "";
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ButtonGroupState> _buttonFilterKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
            title: widget.isEdit ? UPDATECHALLENGE : CREATECHALLENGE),
        body: challengeForm());
  }

  Widget challengeForm() {
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
          // Navigate to ChallengeDetailScreen here
          if (widget.isEdit) {
            Navigator.of(context).pop();
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ChallengeDetailScreen(
                  challengeId: (state).challengeId,
                  challengeName: (state).challengeName,
                ),
              ),
            );
          }
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
                                    existingValue: widget.isEdit
                                        ? widget.challengeDetail?.title!
                                        : "",
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
                              existingValue: widget.isEdit
                                  ? widget.challengeDetail?.challengeEmoji!
                                  : "",
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
                            top: 0, left: 0, right: 60, bottom: 10),
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
                        existingValue: widget.isEdit
                            ? widget.challengeDetail?.description ?? ""
                            : "",
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
                                    existingValue: widget.isEdit
                                        ? convertServerDate(
                                            widget.challengeDetail?.startTime,
                                            DDMMYYYY_SLASH_FORMAT)
                                        : "",
                                    formLabel: '',
                                    showFormLabel: false,
                                    isRequiredField: true,
                                    placeholder: PLACEHOLDER_START_DATE,
                                    isDateField: true,
                                    validator: (value) {
                                      String result =
                                          createChallengeBloc.validateStartDate(
                                              value, selectedEndDate);

                                      if (result == ENTER_START_DATE ||
                                          result ==
                                              START_DATE_END_DATE_VALIDATION ||
                                          result ==
                                              START_DATE_BEFORE_CURRENT_DATE_VALIDATION) {
                                        return result;
                                      } else {
                                        createChallengeRequest.startTime =
                                            result;
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
                              existingValue: widget.isEdit
                                  ? convertServerDate(
                                      widget.challengeDetail?.endTime,
                                      DDMMYYYY_SLASH_FORMAT)
                                  : "",
                              formLabel: '',
                              showFormLabel: false,
                              isRequiredField: true,
                              placeholder: PLACEHOLDER_END_DATE,
                              isDateField: true,
                              onChange: (value) {
                                selectedEndDate = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ENTER_END_DATE;
                                } else {
                                  selectedEndDate = value;
                                  createChallengeRequest.endTime =
                                      getDateInISOFormat(
                                          convertStringDateFormat(
                                              inputFormat:
                                                  DDMMYYYY_SLASH_FORMAT,
                                              outputFormat:
                                                  YYYYMMDD_DASH_FORMAT,
                                              dateToBeFormatted: value));
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFormFieldWidget(
                        feeFieldController: feeFieldController,
                        formLabel: CHALLENGEFEES,
                        isRequiredField: true,
                        placeholder: FIVRUPEEMIN,
                        isAmountTypeField: true,
                        onChange: (value) {
                          _buttonFilterKey.currentState?.updateSelectedIndex(
                              filterButtonNames
                                  .indexOf('₹${int.parse(value)}'));
                          setState(() {
                            feeFieldController.text =
                                int.parse(value).toString();
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
              ButtonGroup(
                key: _buttonFilterKey,
                selectedIndex: widget.isEdit
                    ? filterButtonNames.indexOf(
                        '₹${widget.challengeDetail?.participationFee?.toInt()}')
                    : 0,
                buttonNames: filterButtonNames,
                onItemSelected: (index) {
                  setState(() {
                    feeFieldController.text =
                        filterButtonNames[index].substring(1);
                  });
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomCheckbox(
                    checked: isConditionAccepted,
                    onChange: (value) {
                      setState(() {
                        isConditionAccepted = value!;
                      });
                    },
                  ),
                  const Text(
                    CHALLENGE_ACCEPTING_CONDITION_TEXT,
                    style: TextStyle(
                        fontFamily: "Inter", fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: FilledBtn(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      createChallengeBloc.add(CreateChallengeButtonClickedEvent(
                          createChallengeRequest,
                          widget.isEdit,
                          widget.challengeDetail?.id!));
                    }
                  },
                  label:
                      '${widget.isEdit ? UPDATECHALLENGE : CREATECHALLENGE}  ->',
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  textColor: Colors.white,
                  isButtonEnabled: isConditionAccepted,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
