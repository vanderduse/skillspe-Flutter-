// quiz_bloc.dart
import 'dart:async';
import '../models/quiz_model.dart';


class QuizBloc {
  final List<Quiz> _quizList = [
    Quiz(
      title: "Quiz 1",
      description: "Lorem Ipsum is simply dummy text...",
      startDate: "Starts on 01 Oct 2023",
      participants: 100,
      price: 20.0,
    ),
    Quiz(
      title: "Quiz 2",
      description: "Lorem Ipsum is simply dummy text...",
      startDate: "Starts on 01 Oct 2023",
      participants: 100,
      price: 50.0,
    ),
    Quiz(
      title: "Quiz 2",
      description: "Lorem Ipsum is simply dummy text...",
      startDate: "Starts on 01 Oct 2023",
      participants: 100,
      price: 50.0,
    ),
    Quiz(
      title: "Quiz 2",
      description: "Lorem Ipsum is simply dummy text...",
      startDate: "Starts on 01 Oct 2023",
      participants: 100,
      price: 50.0,
    ),
    Quiz(
      title: "Quiz 2",
      description: "Lorem Ipsum is simply dummy text...",
      startDate: "Starts on 01 Oct 2023",
      participants: 100,
      price: 50.0,
    ),
    Quiz(
      title: "Quiz 2",
      description: "Lorem Ipsum is simply dummy text...",
      startDate: "Starts on 01 Oct 2023",
      participants: 100,
      price: 50.0,
    ),
    // Add more Quiz items here
  ];

  final _quizController = StreamController<List<Quiz>>();

  Stream<List<Quiz>> get quizStream => _quizController.stream;

  QuizBloc() {
    _quizController.add(_quizList);
  }

  void dispose() {
    _quizController.close();
  }
}
