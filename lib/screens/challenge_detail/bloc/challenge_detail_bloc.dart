import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/screens/challenge_detail/model/challenge_detail_response.dart';
import 'package:skills_pe/screens/challenge_detail/respository/challenge_detail_repository.dart';
part 'challenge_detail_event.dart';
part 'challenge_detail_state.dart';

class ChallengeDetailBloc
    extends Bloc<ChallengeDetailEvent, ChallengeDetailState> {
  final ChallengeDetailRepository _challengeDetailRepository;
  ChallengeDetailBloc(this._challengeDetailRepository)
      : super(ChallengeDetailLoadingState()) {
    on<ChallengeDetailInitEvent>(challengeDetailInitEvent);
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
}
