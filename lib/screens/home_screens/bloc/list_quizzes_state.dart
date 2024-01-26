part of 'list_quizzes_bloc.dart';

@immutable
sealed class ListQuizzesState {}

class ListQuizzesInitialState extends ListQuizzesState {}

class ListQuizzesLoadingState extends ListQuizzesState {}

class ListQuizzesSuccessState extends ListQuizzesState {
  final List<QuizzesListResponse> quizzes;
  ListQuizzesSuccessState(this.quizzes);
}

class ListQuizzesFailureState extends ListQuizzesState {
  final String errorMessage;
  ListQuizzesFailureState(this.errorMessage);
}
