import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';
import 'package:skills_pe/screens/home_screens/repository/list_challenges_repo.dart';

part 'list_challenges_event.dart';
part 'list_challenges_state.dart';

class ListChallengeBloc extends Bloc<ListChallengeEvent, ListChallengeState> {
  final ListChallengeRepository _repository;

  ListChallengeBloc(this._repository) : super(ListChallengeInitialState()) {
    on<FetchListChallengeEvent>(_fetchListChallengeEvent);
  }

  Future<void> _fetchListChallengeEvent(
      FetchListChallengeEvent event, Emitter<ListChallengeState> emit) async {
    emit(ListChallengeLoadingState());
    try {
      var response = await _repository.fetchChallenges();
      if (response != null && response.success == true) {
        emit(ListChallengeSuccessState(response.data!));
      } else {
        emit(ListChallengeFailureState('Failed to fetch challenges'));
      }
    } catch (e) {
      emit(ListChallengeFailureState('Failed to fetch challenges: $e'));
    }
  }
}
