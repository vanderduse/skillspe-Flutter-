part of 'quiz_list_bloc.dart';

abstract class QuizListEvent {}

class FetchQuizListEvent extends QuizListEvent {
  final String status;
  final int page;

  FetchQuizListEvent({this.status = "", required this.page});
}
