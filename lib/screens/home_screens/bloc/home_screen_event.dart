part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent {}

class HomeScreenFetchPrivateChallengesEvent extends HomeScreenEvent {}

class HomeScreenFetchPublicChallengesEvent extends HomeScreenEvent {}

class HomeScreenFetchChampaignsEvent extends HomeScreenEvent {}

class HomeScreenFetchQuizEvent extends HomeScreenEvent {}

class HomeScreenFetchTournamentEvent extends HomeScreenEvent {}
