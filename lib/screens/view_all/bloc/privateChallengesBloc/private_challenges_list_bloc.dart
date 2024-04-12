import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/view_all/repository/private_challenges_list_repository.dart';
import 'package:skills_pe/screens/home_screens/model/list_private_challenges_response.dart';
import 'package:skills_pe/utility/constants.dart';
part 'private_challenges_list_event.dart';
part 'private_challenges_list_state.dart';

class PrivateChallengesListBloc
    extends Bloc<PrivateChallengesListEvent, PrivateChallengesListState> {
  final PrivateChallengesListRepository _repository;

  PrivateChallengesListBloc(this._repository) : super(PrivateChallengesListInitialState()) {
    //Intial event which will be fetched on inital render
    on<FetchPrivateChallengesListEvent>(_fetchChallengeList);
  }

  FutureOr<void> _fetchChallengeList(
      FetchPrivateChallengesListEvent event, Emitter<PrivateChallengesListState> emit) async {
    try {
      var response =
          await _repository.fetchPrivateChallengesList(event.status, event.page);
      if (response != null &&
          response.responseCode == API_SUCCESS_CODE &&
          response.data != null) {
        emit(PrivateChallengesListSuccessState(
          privateChallengesList: response.data!,
          hasNext: response.pagination?.hasNext ?? false,
        ));
      } else {
        emit(PrivateChallengesListFailureState('Failed to fetch filtered challenges'));
      }
    } catch (e) {
      emit(PrivateChallengesListFailureState(
          'Failed to fetch filtered challenges: $e'));
    }
  }
}
