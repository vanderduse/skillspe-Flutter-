part of 'list_filtered_challenges_bloc.dart';

abstract class ListFilteredChallengesEvent {}

class FetchListFilteredChallengesEvent extends ListFilteredChallengesEvent {
  final String status;
  final int page;

  FetchListFilteredChallengesEvent({required this.status, required this.page});
}

class FilterButtonClickedEvent extends ListFilteredChallengesEvent {
  final String status;
  final int page;

  FilterButtonClickedEvent({required this.status, required this.page});
}
