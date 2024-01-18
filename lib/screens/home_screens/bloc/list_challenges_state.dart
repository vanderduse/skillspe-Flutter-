part of 'list_challenges_bloc.dart';

abstract class ListChallengesState extends Equatable {
  const ListChallengesState();

  @override
  List<Object> get props => [];
}

class ListChallengesInitial extends ListChallengesState {}

class ListChallengesLoading extends ListChallengesState {}

class ListChallengesLoaded extends ListChallengesState {
  final List<Map<String, dynamic>> challengesData;

  ListChallengesLoaded(this.challengesData);

  @override
  List<Object> get props => [challengesData];
}

class ListChallengesError extends ListChallengesState {
  final String errorMessage;

  ListChallengesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
