import 'package:flutter/material.dart';
import 'package:skills_pe/screens/quiz/widgets/quiz_status.dart';
import 'package:skills_pe/screens/tournaments/widgets/label_value_textbox.dart';

class TournamentDetailContainer extends StatelessWidget {
  final String bannerImageUrl;
  final String title;
  final String description;
  final String dates;
  final int totalTeams;
  final String participationFees;
  final String tournamentStructure;

  const TournamentDetailContainer({
    Key? key,
    required this.bannerImageUrl,
    required this.title,
    required this.description,
    required this.dates,
    required this.totalTeams,
    required this.participationFees,
    required this.tournamentStructure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19717C86),
            blurRadius: 8,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(bannerImageUrl),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 16),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          LabelValueTextbox(label: "Description", value: description),
          const SizedBox(height: 16),
          LabelValueTextbox(label: "Dates", value: dates),
          const SizedBox(height: 16),
          LabelValueTextbox(
              label: "Participation Fees", value: participationFees),
          const SizedBox(height: 16),
          LabelValueTextbox(
              label: "Total no. of Teams", value: totalTeams.toString()),
          const SizedBox(height: 16),
          LabelValueTextbox(
              label: "Tournament Structure", value: tournamentStructure),
        ],
      ),
    );
  }
}
