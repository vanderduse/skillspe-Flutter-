import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:skills_pe/screens/home_screens/model/list_tournaments_response.dart';
import 'package:skills_pe/screens/view_all/repository/tournament_list_repository.dart';
import 'package:skills_pe/utility/constants.dart';
part 'tournament_list_event.dart';
part 'tournament_list_state.dart';

class TournamentListBloc
    extends Bloc<TournamentListEvent, TournamentListState> {
  final TournamentListRepository _repository;
  TournamentListBloc(this._repository) : super(TournamentListInitialState()) {
    on<FetchTournamentListEvent>(_fetchTournamentList);
  }

  Future<FutureOr<void>> _fetchTournamentList(
      FetchTournamentListEvent event, Emitter<TournamentListState> emit) async {
    try {
      var response =
          await _repository.fetchTournaments(event.status, event.page);
      if (response != null &&
          response.responseCode == API_SUCCESS_CODE &&
          response.data != null) {
        emit(TournamentListSuccessState(
          tournamentList: response.data!,
          hasNext: response.pagination?.hasNext ?? false,
        ));
      } else {
        emit(TournamentListFailureState('Failed to fetch filtered challenges'));
      }
    } catch (e) {
      emit(TournamentListFailureState(
          'Failed to fetch filtered challenges: $e'));
    }
  }
}
