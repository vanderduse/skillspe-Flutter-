import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/create_challenge/models/create_challenge_request.dart';
part 'create_challenge_event.dart';
part 'create_challenge_state.dart';

class CreateChallengeBloc
    extends Bloc<CreateChallengeEvent, CreateChallengeState> {
  CreateChallengeBloc() : super(CreateChallengeInitialState()) {
    on<CreateChallengeButtonClickedEvent>(createChallengeButtonClickedEvent);
  }

  FutureOr<void> createChallengeButtonClickedEvent(
      CreateChallengeButtonClickedEvent event,
      Emitter<CreateChallengeState> emit) {
    emit(CreateChallengeLoadingState());
  }
}
