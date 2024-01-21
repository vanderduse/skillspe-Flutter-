import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/skillspe_text_form_field.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/selectable_checkbox.dart';
import 'package:skills_pe/sharedWidgets/title_cancel_appbar.dart';
import 'package:skills_pe/sharedWidgets/image_uploader.dart';
import 'dart:io';
import 'package:skills_pe/utility/constants.dart';

class CreateTournament extends StatefulWidget {
  const CreateTournament({Key? key}) : super(key: key);

  @override
  _CreateTournamentState createState() => _CreateTournamentState();
}

class _CreateTournamentState extends State<CreateTournament> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF4F4F4),
        appBar: appWithTitleAndCancel(CREATE_TOURNAMENT, () {}),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                width: double.infinity,
                child: FileUploader(
                  onUpload: (File file) {
                    // Handle the uploaded file
                    print('File uploaded: ${file.path}');
                  },
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SkillspeTextFormField(
                        label: "Tournament Name",
                        controller: TextEditingController(),
                        required: true,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SkillspeTextFormField(
                        label: "Description",
                        controller: TextEditingController(),
                        required: true,
                        totalLines: 3,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SkillspeTextFormField(
                        label: "Total no. of Teams",
                        type: TextInputType.number,
                        controller: TextEditingController(),
                        required: true,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SkillspeTextFormField(
                        label: "Start Date",
                        type: TextInputType.datetime,
                        controller: TextEditingController(),
                        required: true,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SelectableCheckboxGroup(
                        label: 'Tournament Structure',
                        options: ['Knockout', 'Group'],
                        controller:
                            null, // Provide your initial selected indices here
                        multiselect: false, // Set to false for single selection
                        validator: (selectedOptions) {
                          if (selectedOptions == null ||
                              selectedOptions.isEmpty) {
                            return 'Please select at least one option.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 32, horizontal: 20),
                        child: FilledBtn(
                            label: "Create Tournament",
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            backgroundColor: Theme.of(context).primaryColor,
                            textColor: Colors.white)),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
