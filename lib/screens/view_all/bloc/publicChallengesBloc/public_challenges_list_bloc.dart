import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/home_screens/model/list_public_challenges_response.dart';
import 'package:skills_pe/screens/view_all/repository/public_challenges_list_repository.dart';
import 'package:skills_pe/utility/constants.dart';
part 'public_challenges_list_event.dart';
part 'public_challenges_list_state.dart';

class PublicChallengesListBloc 
    extends Bloc<PublicChallengesListEvent, PublicChallengesListState> {
  final PublicChallengesListRepository _repository;

  PublicChallengesListBloc(this._repository) : super(PublicChallengesListInitialState()) {
    //Intial event which will be fetched on inital render
    on<FetchPublicChallengesListEvent>(_fetchPublicChallengeList);
  }

  FutureOr<void> _fetchPublicChallengeList(
      FetchPublicChallengesListEvent event, Emitter<PublicChallengesListState> emit) async {
    try {
      var response =
          await _repository.fetchPublicChallengesList(event.status, event.page);
      if (response != null &&
          response.responseCode == API_SUCCESS_CODE &&
          response.data != null) {
        emit(PublicChallengesListSuccessState(
          publicChallengesList: response.data!,
          hasNext: response.pagination?.hasNext ?? false,
        ));
      } else {
        emit(PublicChallengesListFailureState('Failed to fetch filtered Public challenges'));
      }
    } catch (e) {
      emit(PublicChallengesListFailureState(
          'Failed to fetch filtered Public challenges: $e'));
    }
  }
}
