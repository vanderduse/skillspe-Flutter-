part of 'private_challenges_list_bloc.dart';

@immutable
sealed class PrivateChallengesListState {}

class PrivateChallengesListInitialState extends PrivateChallengesListState {}

class PrivateChallengesListSuccessState extends PrivateChallengesListState {
  final List<PrivateChallengesListResponse> privateChallengesList;
  final bool hasNext;

  PrivateChallengesListSuccessState({
    required this.privateChallengesList,
    required this.hasNext,
  });
}

class PrivateChallengesListFailureState extends PrivateChallengesListState {
  final String errorMessage;
  PrivateChallengesListFailureState(this.errorMessage);
}
