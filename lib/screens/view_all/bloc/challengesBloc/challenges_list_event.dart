part of 'challenges_list_bloc.dart';

abstract class ChallengesListEvent {}

class FetchChallengesListEvent extends ChallengesListEvent {
  final String status;
  final int page;
  FetchChallengesListEvent({required this.status, required this.page});
}
