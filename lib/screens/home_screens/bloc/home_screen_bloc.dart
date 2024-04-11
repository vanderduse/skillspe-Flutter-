import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/home_screens/model/list_campaign_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_private_challenges_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_public_challenges_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_tournaments_response.dart';
import 'package:skills_pe/screens/home_screens/repository/home_screen_repository.dart';
import 'package:skills_pe/utility/constants.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final HomeScreenRepository _homeScreenRepository;
  HomeScreenBloc(this._homeScreenRepository) : super(HomeScreenInitialState()) {
    on<HomeScreenFetchPrivateChallengesEvent>(_fetchPrivateChallengesList);
    on<HomeScreenFetchPublicChallengesEvent>(_fetchPublicChallengesList);
    on<HomeScreenFetchQuizEvent>(_fetchQuizList);
    on<HomeScreenFetchChampaignsEvent>(_fetchChampaignList);
    // on<HomeScreenFetchTournamentEvent>(_fetchTournamentList);
  }

  FutureOr<void> _fetchPrivateChallengesList(
      HomeScreenFetchPrivateChallengesEvent event,
      Emitter<HomeScreenState> emit) async {
    emit(HomeScreenChallengeLoadingState());
    try {
      var response = await _homeScreenRepository.fetchPrivateChallenges();
      if (response != null &&
          response.responseCode == API_SUCCESS_CODE &&
          response.data != null) {
        print("print====================>");
        emit(HomeScreenPrivateChallengeSuccessState(response.data!));
      } else {
        print("else====================>");
        emit(HomeScreenPrivateChallengeFailureState(
            'Failed to fetch challenges'));
      }
    } catch (e) {
      emit(HomeScreenPrivateChallengeFailureState(
          'Failed to fetch challenges: $e'));
    }
  }

  FutureOr<void> _fetchPublicChallengesList(
      HomeScreenFetchPublicChallengesEvent event,
      Emitter<HomeScreenState> emit) async {
    emit(HomeScreenPublicChallengeLoadingState());
    try {
      var response = await _homeScreenRepository.fetchPublicChallenges();
      if (response != null &&
          response.responseCode == API_SUCCESS_CODE &&
          response.data != null) {
        emit(HomeScreenPublicChallengeSuccessState(response.data!));
      } else {
        emit(HomeScreenPublicChallengeFailureState(
            'Failed to fetch challenges'));
      }
    } catch (e) {
      emit(HomeScreenPublicChallengeFailureState(
          'Failed to fetch challenges: $e'));
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

  FutureOr<void> _fetchChampaignList(HomeScreenFetchChampaignsEvent event,
      Emitter<HomeScreenState> emit) async {
    emit(HomeScreenChampaignLoadingState());
    try {
      var response = await _homeScreenRepository.fetchChampaign();
      if (response != null &&
          response.responseCode == "SS0200" &&
          response.data != null) {
        emit(HomeScreenChampaignSuccessState(response.data!));
      } else {
        emit(HomeScreenChampaignFailureState('Failed to fetch champaigns'));
      }
    } catch (e) {
      emit(HomeScreenChampaignFailureState('Failed to fetch champaigns: $e'));
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
