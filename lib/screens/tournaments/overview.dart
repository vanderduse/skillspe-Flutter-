import 'package:flutter/material.dart';
import 'package:skills_pe/screens/tournaments/widgets/tournament_details_cards.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';

class TournamentOverview extends StatefulWidget {
  const TournamentOverview({Key? key}) : super(key: key);

  @override
  State<TournamentOverview> createState() => _TournamentOverviewState();
}

class _TournamentOverviewState extends State<TournamentOverview> {
  late double appBarHeight;
  late double tabBarHeight;

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
            children: [
              const Center(
                child: Text(
                  "Tournament Details",
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
              const TournamentDetailContainer(
                bannerImageUrl: "https://placehold.jp/318x150.png",
                title: "MIT Cricket Tournament",
                description:
                    "Lorem ipsum dolor sit amet consectetur. Ut enim ac etiam sed malesuada consequat venenatis.",
                dates: "June 30, 2023 - Jul 30, 2023",
                participationFees: "\$ 10",
                totalTeams: 14,
                tournamentStructure: "Knockout",
              ),
              const SizedBox(height: 16),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: FilledBtn(
                  label: "Share",
                  onPressed: () => {},
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
