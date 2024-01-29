part of 'list_filtered_challenges_bloc.dart';

@immutable
sealed class ListFilteredChallengesState {}

class ListFilteredChallengesInitialState extends ListFilteredChallengesState {}

class ListFilteredChallengesLoadingState extends ListFilteredChallengesState {}

class ListFilteredChallengesSuccessState extends ListFilteredChallengesState {
  final List<ChallengesListResponse> filteredChallenges;
  final bool hasReachedMax;

  ListFilteredChallengesSuccessState({
    required this.filteredChallenges,
    required this.hasReachedMax,
  });
}

class ListFilteredChallengesFailureState extends ListFilteredChallengesState {
  final String errorMessage;
  ListFilteredChallengesFailureState(this.errorMessage);
}
