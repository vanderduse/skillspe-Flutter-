import 'package:flutter/material.dart';
import 'package:skills_pe/screens/tournaments/overview.dart';
import 'package:skills_pe/screens/tournaments/teams.dart';
import 'package:skills_pe/screens/tournaments/fixture.dart';
import 'package:skills_pe/screens/tournaments/leaderboard.dart';
import 'package:skills_pe/screens/tournaments/settings.dart';
import 'package:skills_pe/screens/tournaments/widgets/tab_appbar.dart';

class TournamentHome extends StatefulWidget {
  const TournamentHome({super.key});

  @override
  State<TournamentHome> createState() => _TournamentHomeState();
}

class _TournamentHomeState extends State<TournamentHome> {
  void handleCheckboxChange(bool value) {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Color(0xffF4F4F4),
          appBar: tabAppbar(context, "Tournament", 2000.00),
          body: const TabBarView(
            children: [
              TournamentOverview(),
              TournamentTeams(),
              TournamentFixture(),
              TournamentLeaderboard(),
              TournamentSettings(),
            ],
          ),
        ));
  }
}
