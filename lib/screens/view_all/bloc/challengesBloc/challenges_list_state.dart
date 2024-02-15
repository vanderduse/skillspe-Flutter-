part of 'challenges_list_bloc.dart';

@immutable
sealed class ChallengesListState {}

class ChallengesListInitialState extends ChallengesListState {}

class ChallengesListSuccessState extends ChallengesListState {
  final List<ChallengesListResponse> challengesList;
  final bool hasNext;

  ChallengesListSuccessState({
    required this.challengesList,
    required this.hasNext,
  });
}

class ChallengesListFailureState extends ChallengesListState {
  final String errorMessage;
  ChallengesListFailureState(this.errorMessage);
}
