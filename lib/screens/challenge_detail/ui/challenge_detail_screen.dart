import 'package:flutter/material.dart';
import 'package:skills_pe/screens/challenge_detail/ui/challenge_detail_tab.dart';

class ChallengeDetailScreen extends StatefulWidget {
  final String? challengeId;
  final String? challengeName;
  const ChallengeDetailScreen(
      {super.key, required this.challengeId, required this.challengeName});

  @override
  State<StatefulWidget> createState() => _ChallengeDetailState();
}

class _ChallengeDetailState extends State<ChallengeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.challengeName!),
          automaticallyImplyLeading: true,
          shadowColor: Colors.black,
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.info)),
            Tab(icon: Icon(Icons.bar_chart_sharp)),
            Tab(icon: Icon(Icons.settings)),
          ]),
        ),
        body: TabBarView(children: [
          ChallengeDetailTab(challengeId: widget.challengeId),
          ChallengeDetailTab(challengeId: widget.challengeId),
          ChallengeDetailTab(challengeId: widget.challengeId)
        ]),
      ),
    );
  }
}
