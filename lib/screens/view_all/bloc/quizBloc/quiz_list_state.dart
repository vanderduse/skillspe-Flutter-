part of 'quiz_list_bloc.dart';

@immutable
sealed class QuizListState {}

class QuizListInitialState extends QuizListState {}

class QuizListSuccessState extends QuizListState {
  final List<QuizzesListResponse> quizList;
  final bool hasNext;

  QuizListSuccessState({
    required this.quizList,
    required this.hasNext,
  });
}

class QuizListFailureState extends QuizListState {
  final String errorMessage;
  QuizListFailureState(this.errorMessage);
}
