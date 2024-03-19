part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent {}

class HomeScreenFetchChallengesEvent extends HomeScreenEvent {
  final bool isPublic;
  HomeScreenFetchChallengesEvent({required this.isPublic});
}

class HomeScreenFetchQuizEvent extends HomeScreenEvent {}

class HomeScreenFetchTournamentEvent extends HomeScreenEvent {}
