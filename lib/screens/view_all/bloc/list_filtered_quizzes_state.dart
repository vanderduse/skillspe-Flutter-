part of 'list_filtered_quizzes_bloc.dart';

@immutable
sealed class ListFilteredQuizzesState {}

class ListFilteredQuizzesInitialState extends ListFilteredQuizzesState {}

class ListFilteredQuizzesLoadingState extends ListFilteredQuizzesState {}

class ListFilteredQuizzesSuccessState extends ListFilteredQuizzesState {
  final List<QuizzesListResponse> filteredQuizzes;
  final bool hasReachedMax;

  ListFilteredQuizzesSuccessState({
    required this.filteredQuizzes,
    required this.hasReachedMax,
  });
}

class ListFilteredQuizzesFailureState extends ListFilteredQuizzesState {
  final String errorMessage;
  ListFilteredQuizzesFailureState(this.errorMessage);
}
