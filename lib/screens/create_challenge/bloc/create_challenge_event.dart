part of 'create_challenge_bloc.dart';

@immutable
sealed class CreateChallengeEvent {}

class CreateChallengeButtonClickedEvent extends CreateChallengeEvent {
  final CreateChallengeRequest createChallengeRequest;
  CreateChallengeButtonClickedEvent(this.createChallengeRequest);
}
