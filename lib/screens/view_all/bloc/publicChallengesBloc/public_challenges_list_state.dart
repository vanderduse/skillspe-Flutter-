part of 'public_challenges_list_bloc.dart';

@immutable
sealed class PublicChallengesListState {}

class PublicChallengesListInitialState extends PublicChallengesListState {}

class PublicChallengesListSuccessState extends PublicChallengesListState {
  final List<PublicChallengesListResponse> publicChallengesList;
  final bool hasNext;

  PublicChallengesListSuccessState({
    required this.publicChallengesList,
    required this.hasNext,
  });
}

class PublicChallengesListFailureState extends PublicChallengesListState {
  final String errorMessage;
  PublicChallengesListFailureState(this.errorMessage);
}
