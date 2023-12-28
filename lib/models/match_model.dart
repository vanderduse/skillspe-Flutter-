import 'package:skills_pe/screens/tournaments/models/TeamModel.dart';

class Match {
  final List<Team> teamSet;
  final String? winningTeamId;
  final String startDate;
  final String endDate;
  final String? groupName;
  bool isExpanded;

  Match(
      {required this.teamSet,
      required this.startDate,
      required this.endDate,
      this.winningTeamId,
      this.groupName,
      this.isExpanded = true // Making winningTeamId nullable
      });
}
