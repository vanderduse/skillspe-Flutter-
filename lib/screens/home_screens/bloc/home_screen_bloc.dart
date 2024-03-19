import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_tournaments_response.dart';
import 'package:skills_pe/screens/home_screens/repository/home_screen_repository.dart';
import 'package:skills_pe/utility/constants.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final HomeScreenRepository _homeScreenRepository;
  HomeScreenBloc(this._homeScreenRepository) : super(HomeScreenInitialState()) {
    on<HomeScreenFetchChallengesEvent>(_fetchChallengesList);
    on<HomeScreenFetchQuizEvent>(_fetchQuizList);
    on<HomeScreenFetchTournamentEvent>(_fetchTournamentList);
  }

  FutureOr<void> _fetchChallengesList(HomeScreenFetchChallengesEvent event,
      Emitter<HomeScreenState> emit) async {
    emit(HomeScreenChallengeLoadingState());
    try {
      var response =
          await _homeScreenRepository.fetchChallenges(event.isPublic);
      if (response != null &&
          response.responseCode == API_SUCCESS_CODE &&
          response.data != null) {
        emit(HomeScreenChallengeSuccessState(response.data!));
      } else {
        emit(HomeScreenChallengeFailureState('Failed to fetch challenges'));
      }
    } catch (e) {
      emit(HomeScreenChallengeFailureState('Failed to fetch challenges: $e'));
    }
  }

  FutureOr<void> _fetchQuizList(
      HomeScreenFetchQuizEvent event, Emitter<HomeScreenState> emit) async {
    emit(HomeScreenQuizLoadingState());
    try {
      var response = await _homeScreenRepository.fetchQuizzes();
      if (response != null &&
          response.responseCode == API_SUCCESS_CODE &&
          response.data != null) {
        emit(HomeScreenQuizSuccessState(response.data!));
      } else {
        emit(HomeScreenQuizFailureState('Failed to fetch Quizzes'));
      }
    } catch (e) {
      emit(HomeScreenQuizFailureState('Failed to fetch Quizzes: $e'));
    }
  }

  FutureOr<void> _fetchTournamentList(HomeScreenFetchTournamentEvent event,
      Emitter<HomeScreenState> emit) async {
    try {
      var response = await _homeScreenRepository.fetchTournaments();
      if (response != null &&
          response.responseCode == API_SUCCESS_CODE &&
          response.data != null) {
        emit(HomeScreenTournamentsSuccessState(response.data!));
      } else {
        emit(HomeScreenTournamentsFailureState('Failed to fetch Tournaments'));
      }
    } catch (e) {
      emit(
          HomeScreenTournamentsFailureState('Failed to fetch Tournaments: $e'));
    }
  }
}
