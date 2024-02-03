part of 'quiz_bloc.dart';

sealed class QuizState {}

class QuizInitialState extends QuizState {}

class QuizLoadingState extends QuizState {}

class QuizSubmitLoadingState extends QuizState {}

class QuizApiSuccessState extends QuizState {
  QuizInformationResponseModel quizInformationResponseModel;
  QuizApiSuccessState(this.quizInformationResponseModel);
}

class QuizApiFailureState extends QuizState {
  final String errorMessage;
  QuizApiFailureState(this.errorMessage);
}

class QuizPlaySuccessState extends QuizState {
  List<QuizQuestionAnswerSetModel>? quizQuestionSet;
  QuizPlaySuccessState(this.quizQuestionSet);
}

class QuizPlayFailureState extends QuizState {
  final String errorMessage;
  QuizPlayFailureState(this.errorMessage);
}

class QuizSubmitSucessState extends QuizState {}
