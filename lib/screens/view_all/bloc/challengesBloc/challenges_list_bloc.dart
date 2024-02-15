import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/view_all/repository/challenges_list_repository.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';
part 'challenges_list_event.dart';
part 'challenges_list_state.dart';

class ChallengesListBloc
    extends Bloc<ChallengesListEvent, ChallengesListState> {
  final ChallengesListRepository _repository;

  ChallengesListBloc(this._repository) : super(ChallengesListInitialState()) {
    //Intial event which will be fetched on inital render
    on<FetchChallengesListEvent>(_fetchChallengeList);
  }

  FutureOr<void> _fetchChallengeList(
      FetchChallengesListEvent event, Emitter<ChallengesListState> emit) async {
    try {
      var response =
          await _repository.fetchChallengesList(event.status, event.page);
      if (response != null &&
          response.success == true &&
          response.data != null) {
        emit(ChallengesListSuccessState(
          challengesList: response.data!,
          hasNext: response.pagination?.hasNext ?? false,
        ));
      } else {
        emit(ChallengesListFailureState('Failed to fetch filtered challenges'));
      }
    } catch (e) {
      emit(ChallengesListFailureState(
          'Failed to fetch filtered challenges: $e'));
    }
  }
}
