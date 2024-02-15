part of 'tournament_list_bloc.dart';

abstract class TournamentListState {}

class TournamentListInitialState extends TournamentListState {}

class TournamentListLoadingState extends TournamentListState {}

class TournamentListSuccessState extends TournamentListState {
  final List<TournamentsListResponse> tournamentList;
  final bool hasNext;

  TournamentListSuccessState({
    required this.tournamentList,
    required this.hasNext,
  });
}

class TournamentListFailureState extends TournamentListState {
  final String errorMessage;
  TournamentListFailureState(this.errorMessage);
}
