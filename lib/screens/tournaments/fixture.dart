import 'package:flutter/material.dart';
import 'package:skills_pe/screens/tournaments/models/TeamModel.dart';
import 'package:skills_pe/screens/tournaments/widgets/no_teams_card.dart';
import 'package:skills_pe/screens/tournaments/widgets/team_card.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/filter_buttons.dart';

class TournamentFixture extends StatefulWidget {
  const TournamentFixture({Key? key}) : super(key: key);

  @override
  State<TournamentFixture> createState() => _TournamentFixtureState();
}

class _TournamentFixtureState extends State<TournamentFixture> {
  late double appBarHeight;
  List<Team> teams = [
    Team(
      teamName: "Team A",
      accentColor: "FF5733",
      captainName: "John Doe",
      captainProfile: "https://via.placeholder.com/24x24",
      round: 1,
    ),
    Team(
      teamName: "Team B",
      accentColor: "00FF00",
      captainName: "Jane Doe",
      captainProfile: "https://via.placeholder.com/24x24",
      round: 1,
    ),
    Team(
      teamName: "Team C",
      accentColor: "0000FF",
      captainName: "Alice",
      captainProfile: "https://via.placeholder.com/24x24",
      round: 2,
    ),
    Team(
      teamName: "Team D",
      accentColor: "9747FF",
      captainName: "Ruben Philips",
      captainProfile: "https://via.placeholder.com/24x24",
      round: 2,
    ),
    Team(
      teamName: "Team E",
      accentColor: "FF00FF",
      captainName: "Bob",
      captainProfile: "https://via.placeholder.com/24x24",
      round: 3,
    ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Center(
                child: Text(
                  "Teams",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0A121A),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ButtonGroup(buttonNames: [
                "All",
                "Round 1",
                "Round 2",
                "Round 3",
              ], onItemSelected: (int index) => {}),
              Expanded(
                child: _buildSectionedListView(),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: FilledBtn(
                  label: "Share",
                  onPressed: () => {},
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

  Widget _buildSectionedListView() {
    // Group teams by round
    Map<int, List<Team>> groupedTeams = {};
    teams.forEach((team) {
      if (!groupedTeams.containsKey(team.round)) {
        groupedTeams[team.round] = [];
      }
      groupedTeams[team.round]?.add(team);
    });

    // Build sections
    List<Widget> sections = [];
    groupedTeams.forEach((round, teams) {
      sections.add(_buildSection(round, teams));
    });

    return ListView(
      shrinkWrap: true,
      children: sections,
    );
  }

  Widget _buildSection(int round, List<Team> teams) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          "Round $round Teams",
          style: TextStyle(
            color: Color(0xFF0A121A),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          itemCount: teams.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                TeamCard(teamDetails: teams[index]),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ],
    );
  }
}
