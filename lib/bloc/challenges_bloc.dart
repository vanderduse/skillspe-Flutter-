/*
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/challenge_model.dart';

class Challengess {
  final List<ChallengeItem> _challengelist = [
    ChallengeItem(
      title: "Quiz 1",
      description: "Lorem Ipsum is simply dummy text...",
       date: '22-10-2023',
    ),
    ChallengeItem(
      title: "Quiz 2",
      description: "Lorem Ipsum is simply dummy text...",
      date: '22-10-2023'
    ),
    ChallengeItem(
      title: "Quiz 2",
      description: "Lorem Ipsum is simply dummy text...",
      date: '22-10-2023',

    ),
  ];
}*/
/*
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/challenge_model.dart';

class ChallengesBloc extends Cubit<List<ChallengeItem>> {
  ChallengesBloc() : super([]);

  void fetchChallenges() {
    final List<ChallengeItem> challenges = [
      ChallengeItem(
        title: 'Your first challenge title',
        description: 'Your first challenge description',
        date: '22-10-2003',
      ),
      ChallengeItem(
        title: 'Second challenge title',
        description: 'Second challenge description',
        date: '22-10-2003',
      ),
      // Add more challenge items as needed
    ];
    emit(challenges);
  }

}
*/


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/challenge_model.dart';

import 'package:bloc/bloc.dart';
extension StreamIterableExtension on Stream {
  StreamIterator asIterable<T>() {
    return StreamIterator(this);
  }
}


class ChallengeBloc extends Cubit<List<ChallengeItem>> implements StateStreamable<List<ChallengeItem>> {
  final StreamController<List<ChallengeItem>> _challengesController = StreamController<List<ChallengeItem>>();

  ChallengeBloc() : super([]) {
    _challengesController.add(state);
  }


  @override
  Stream<List<ChallengeItem>> get challengesStream => _challengesController.stream.where((challenges) => challenges != null);

  void fetchChallenges() {
    final List<ChallengeItem> challenges = [
      ChallengeItem(title: "Challenge 1", description: "Description 1", date: ''),
      ChallengeItem(title: "Challenge 2", description: "Description 2", date: ''),
      // Add more challenge items as needed
    ];
    emit(challenges);
    _challengesController.add(challenges);
  }

  @override
  Future<void> close() {
    _challengesController.close();
    return super.close();
  }
}


