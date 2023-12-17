import 'package:flutter/material.dart';
import 'package:skills_pe/screens/tournaments/models/TeamModel.dart';
import 'package:skills_pe/screens/tournaments/widgets/no_teams_card.dart';
import 'package:skills_pe/screens/tournaments/widgets/team_card.dart';
import 'package:skills_pe/screens/tournaments/widgets/tournament_details_cards.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';

class TournamentTeams extends StatefulWidget {
  const TournamentTeams({super.key});

  @override
  State<TournamentTeams> createState() => _TournamentTeamsState();
}

class _TournamentTeamsState extends State<TournamentTeams> {
  late double appBarHeight;
  late double tabBarHeight;
  late bool teamsAvailable;
  List<Team> teams = [
    Team(
      teamName: "Team A",
      accentColor: "FF5733",
      captainName: "John Doe",
      captainProfile: "https://via.placeholder.com/24x24",
    ),
    Team(
      teamName: "Team B",
      accentColor: "00FF00",
      captainName: "Jane Doe",
      captainProfile: "https://via.placeholder.com/24x24",
    ),
    Team(
      teamName: "Team C",
      accentColor: "0000FF",
      captainName: "Alice",
      captainProfile: "https://via.placeholder.com/24x24",
    ),
    Team(
      teamName: "Team D",
      accentColor: "9747FF",
      captainName: "Ruben Philips",
      captainProfile: "https://via.placeholder.com/24x24",
    ),
    Team(
      teamName: "Team E",
      accentColor: "FF00FF",
      captainName: "Bob",
      captainProfile: "https://via.placeholder.com/24x24",
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
}
