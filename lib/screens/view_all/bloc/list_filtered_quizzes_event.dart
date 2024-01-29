part of 'list_filtered_quizzes_bloc.dart';

abstract class ListFilteredQuizzesEvent {}

class FetchListFilteredQuizzesEvent extends ListFilteredQuizzesEvent {
  final String status;
  final int page;

  FetchListFilteredQuizzesEvent({required this.status, required this.page});
}

class FilterButtonClickedEvent extends ListFilteredQuizzesEvent {
  final String status;
  final int page;

  FilterButtonClickedEvent({required this.status, required this.page});
}
