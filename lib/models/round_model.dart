import 'package:skills_pe/models/match_model.dart';

class Round {
  final List<Match> matches;
  final String roundName;
  final String startDate;
  final int endDate;

  Round({
    required this.matches,
    required this.roundName,
    required this.startDate,
    required this.endDate,
  });
}
