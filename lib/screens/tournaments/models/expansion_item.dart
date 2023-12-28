import 'package:skills_pe/models/match_model.dart';
import 'package:skills_pe/screens/tournaments/models/TeamModel.dart';

class Item {
  Item({
    this.expandedList,
    this.headerValue,
    this.isExpanded = false,
  });

  List<Match>? expandedList;
  String? headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Round ${index + 1}',
      expandedList:
          List<Match>.generate(matches.length, (index) => matches[index]),
    );
  });
}

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
  )
];
