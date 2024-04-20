import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/screens/challenge_detail/model/users_list_response.dart';
import 'package:skills_pe/screens/challenge_detail/model/challenge_detail_response.dart';
import 'package:skills_pe/screens/challenge_detail/respository/challenge_detail_repository.dart';
import 'package:skills_pe/utility/constants.dart';
part 'challenge_detail_event.dart';
part 'challenge_detail_state.dart';

class ChallengeDetailBloc
    extends Bloc<ChallengeDetailEvent, ChallengeDetailState> {
  final ChallengeDetailRepository _challengeDetailRepository;
  ChallengeDetailBloc(this._challengeDetailRepository)
      : super(ChallengeDetailInitialState()) {
    on<ChallengeDetailInitEvent>(challengeDetailInitEvent);
    on<ChallengeDetailFetchUsersListEvent>(_fetchUsersList);
  }

  FutureOr<void> challengeDetailInitEvent(ChallengeDetailInitEvent event,
      Emitter<ChallengeDetailState> emit) async {
    emit(ChallengeDetailLoadingState());
    BaseResponseModel<ChallengeDetailResponse> res =
        await _challengeDetailRepository
            .getChallengeDetails(event.challengeId!);
    if (res.data == null && res.message != null) {
      emit(ChallengeDetailFailureState(errorMessage: res.message!));
    } else {
      emit(ChallengeDetailSuccessState(challengeDetailResponse: res.data!));
    }
  }

  FutureOr<void> _fetchUsersList(ChallengeDetailFetchUsersListEvent event,
      Emitter<ChallengeDetailState> emit) async {
    emit(UsersListLoadingState());
    try {
      var response =
          await _challengeDetailRepository.getUsersList(event.userType);
      if (response.data != null) {
        print("under if");
        emit(UsersListSuccessState(response.data! as List<UsersListResponse>));
      } else {
        print("else");
        emit(UsersListFailureState('Failed to fetch users list'));
      }
    } catch (e) {
      print("catch===> $e");
      emit(UsersListFailureState('Failed to fetch users list: $e'));
    }
  }
}
