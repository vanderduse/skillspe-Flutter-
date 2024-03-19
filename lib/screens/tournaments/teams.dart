import 'package:flutter/material.dart';
import 'package:skills_pe/screens/tournaments/models/TeamModel.dart';
import 'package:skills_pe/screens/tournaments/widgets/create_team_bottom_sheet.dart';
import 'package:skills_pe/screens/tournaments/widgets/no_teams_card.dart';
import 'package:skills_pe/screens/tournaments/widgets/team_card.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/icon_checkbox_grid.dart';
import 'package:skills_pe/sharedWidgets/skillspe_text_form_field.dart';
import 'package:skills_pe/sharedWidgets/vertical_separator.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/list_utility.dart';

class TournamentTeams extends StatefulWidget {
  const TournamentTeams({super.key});

  @override
  State<TournamentTeams> createState() => _TournamentTeamsState();
}

class _TournamentTeamsState extends State<TournamentTeams> {
  late double appBarHeight;
  late double tabBarHeight;
  late bool teamsAvailable;
  final _formKey = GlobalKey<FormState>();

  List<Team> teams = [
    Team(
        teamName: "Team A",
        accentColor: "FF5733",
        captainName: "John Doe",
        captainProfile: "https://via.placeholder.com/24x24",
        round: 1),
    Team(
        teamName: "Team B",
        accentColor: "00FF00",
        captainName: "Jane Doe",
        captainProfile: "https://via.placeholder.com/24x24",
        round: 1),
    Team(
        teamName: "Team C",
        accentColor: "0000FF",
        captainName: "Alice",
        captainProfile: "https://via.placeholder.com/24x24",
        round: 1),
    Team(
        teamName: "Team D",
        accentColor: "9747FF",
        captainName: "Ruben Philips",
        captainProfile: "https://via.placeholder.com/24x24",
        round: 1),
    Team(
        teamName: "Team E",
        accentColor: "FF00FF",
        captainName: "Bob",
        captainProfile: "https://via.placeholder.com/24x24",
        round: 1),
  ];

  @override
  Widget build(BuildContext context) {
    appBarHeight = Scaffold.of(context).appBarMaxHeight ?? 0.0;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              appBarHeight * 1.2, // Adjust the height as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  TEAMS,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: teams.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: teams.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            TeamCard(teamDetails: teams[index]),
                            const SizedBox(
                                height: 16), // Adjust the height as needed
                          ],
                        ),
                      )
                    : const NoTeamContainer(),
              ),
              // ,
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: FilledBtn(
                  label: "Share",
                  onPressed: () => {
                    BottomSheetManager.showGenericBottomSheet(
                        context,
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24, horizontal: 20),
                                    child: Column(
                                      children: [
                                        SkillspeTextFormField(
                                            required: true,
                                            controller: TextEditingController(),
                                            label: TEAM_NAME),
                                        const VerticalSeparator(),
                                        const VerticalSeparator(),
                                        IconCheckboxGrid(
                                            label: TEAM_ACCENT_COLOR,
                                            multiSelect: false,
                                            options: ListUtils.getRandomValues(
                                                    NEON_HEX_COLORS, 9)
                                                .map((color) => OptionDetails(
                                                      iconPath:
                                                          JERSEY_ICON_PATH,
                                                      accentColor: Color(
                                                          int.parse(
                                                              '0xFF$color')),
                                                      value: color,
                                                    ))
                                                .toList()),
                                      ],
                                    )),
                                Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Column(
                                    children: [
                                      const Divider(
                                        color:
                                            Color.fromARGB(168, 158, 158, 158),
                                        thickness:
                                            1, // You can adjust the thickness as needed
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 24, 20, 4),
                                        child: FilledBtn(
                                            label: SAVE,
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                BottomSheetManager
                                                    .closeModalSheet(context);
                                              }
                                            },
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            textColor: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                        CREATE_YOUR_TEAM)
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
