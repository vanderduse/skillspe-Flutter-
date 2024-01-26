part of 'list_challenges_bloc.dart';

@immutable
sealed class ListChallengeState {}

class ListChallengeInitialState extends ListChallengeState {}

class ListChallengeLoadingState extends ListChallengeState {}

class ListChallengeSuccessState extends ListChallengeState {
  final List<ChallengesListResponse> challenges;
  ListChallengeSuccessState(this.challenges);
}

class ListChallengeFailureState extends ListChallengeState {
  final String errorMessage;
  ListChallengeFailureState(this.errorMessage);
}
