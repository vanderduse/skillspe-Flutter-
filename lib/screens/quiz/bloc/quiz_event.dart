part of 'quiz_bloc.dart';

sealed class QuizEvent {}

class QuizInitialEvent extends QuizEvent {
  final String quidId;
  QuizInitialEvent(this.quidId);
}

class QuizPlayEvent extends QuizEvent {
  final String quidId;
  QuizPlayEvent(this.quidId);
}

class QuizSubmitEvent extends QuizEvent {
  final List<QuizAnswerSet> quizAnswerSetList;
  final String quizId;
  QuizSubmitEvent({required this.quizAnswerSetList, required this.quizId});
}
