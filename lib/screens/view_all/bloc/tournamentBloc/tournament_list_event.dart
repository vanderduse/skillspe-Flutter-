part of 'tournament_list_bloc.dart';

abstract class TournamentListEvent {}

class FetchTournamentListEvent extends TournamentListEvent {
  final String status;
  final int page;

  FetchTournamentListEvent({this.status = "", required this.page});
}
