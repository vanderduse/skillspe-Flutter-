import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/home_screens/model/list_tournaments_response.dart';
import 'package:skills_pe/screens/home_screens/repository/list_tournaments_repo.dart';

part 'list_tournaments_event.dart';
part 'list_tournaments_state.dart';

class ListTournamentsBloc extends Bloc<ListTournamentsEvent, ListTournamentsState> {
  final ListTournamentsRepository _repository;

  ListTournamentsBloc(this._repository) : super(ListTournamentsInitialState()) {
    on<FetchListTournamentsEvent>(_fetchListTournamentsEvent);
  }

  Future<void> _fetchListTournamentsEvent(
      FetchListTournamentsEvent event, Emitter<ListTournamentsState> emit) async {
    emit(ListTournamentsLoadingState());
    try {
      var response = await _repository.fetchTournaments();
      if (response != null && response.success == true) {
        emit(ListTournamentsSuccessState(response.data!));
      } else {
        emit(ListTournamentsFailureState('Failed to fetch Tournaments'));
      }
    } catch (e) {
      emit(ListTournamentsFailureState('Failed to fetch Tournaments: $e'));
    }
  }
}
