part of 'list_challenges_bloc.dart';

abstract class ListChallengesEvent extends Equatable {
  const ListChallengesEvent();
}

class InitialFetchEvent extends ListChallengesEvent {
  @override
  List<Object> get props => [];
}
