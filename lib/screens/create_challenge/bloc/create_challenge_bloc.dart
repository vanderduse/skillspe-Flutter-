import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/create_challenge/models/create_challenge_request.dart';
import 'package:skills_pe/screens/create_challenge/repository/create_challenge_repository.dart';
part 'create_challenge_event.dart';
part 'create_challenge_state.dart';

class CreateChallengeBloc
    extends Bloc<CreateChallengeEvent, CreateChallengeState> {
  final CreateChallengeRepository _challengeRepository;
  CreateChallengeBloc(this._challengeRepository)
      : super(CreateChallengeInitialState()) {
    on<CreateChallengeButtonClickedEvent>(createChallengeButtonClickedEvent);
  }

  FutureOr<void> createChallengeButtonClickedEvent(
      CreateChallengeButtonClickedEvent event,
      Emitter<CreateChallengeState> emit) async {
    emit(CreateChallengeLoadingState());
    var res = await _challengeRepository.createChallenge(
        createChallengeRequest: event.createChallengeRequest);
    if (res!.data == null) {
      emit(CreateChallengeFailureState(errorMessage: res.message!));
    } else {
      print(res);
      print("below is res.data");
      print(res.data);
      emit(CreateChallengeSuccessState(
          successMessage: res.message!,
          challengeId: res.data!.id!,
          challengeName: res.data!.title!));
    }
  }
}
