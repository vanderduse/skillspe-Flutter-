import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'public_challenge_detail_event.dart';
part 'public_challenge_detail_state.dart';

class PublicChallengeDetailBloc extends Bloc<PublicChallengeDetailEvent, PublicChallengeDetailState> {
  PublicChallengeDetailBloc() : super(PublicChallengeDetailInitial()) {
    on<PublicChallengeDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
