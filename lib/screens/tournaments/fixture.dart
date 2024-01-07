import 'package:flutter/material.dart';
import 'package:skills_pe/screens/tournaments/edit_matches.dart';
import 'package:skills_pe/screens/tournaments/models/TeamModel.dart';
import 'package:skills_pe/screens/tournaments/widgets/match_card.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/filter_buttons.dart';
import 'package:skills_pe/models/match_model.dart';

class TournamentFixture extends StatefulWidget {
  const TournamentFixture({Key? key}) : super(key: key);

  @override
  State<TournamentFixture> createState() => _TournamentFixtureState();
}

class _TournamentFixtureState extends State<TournamentFixture> {
  late double appBarHeight;
  List<Match> matches = [
    Match(
      teamSet: [
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
      ],
      winningTeamId: null,
      startDate: "startDate",
      endDate: "endDate",
      groupName: "Group 1",
    ),
    // Add more matches as needed
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
              ButtonGroup(
                buttonNames: const [
                  "Group 1",
                  "Group 2",
                  "Knockout",
                  "Semi",
                  "Finals"
                ],
                onItemSelected: (int index) => {},
              ),
              const SizedBox(height: 28),
              Expanded(
                child: _buildMatchesListView(),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: FilledBtn(
                  label: "Edit Matches",
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditMatches()))
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

  Widget _buildMatchesListView() {
    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            MatchCard(
                matchDetails: matches[index],
                biddingDone: false,
                resultsDeclared: true),
            const SizedBox(height: 16),
            MatchCard(
                matchDetails: matches[index],
                biddingDone: true,
                resultsDeclared: true),
            const SizedBox(height: 16),
            MatchCard(
                matchDetails: matches[index],
                biddingDone: false,
                resultsDeclared: false),
          ],
        );
      },
    );
  }
}
