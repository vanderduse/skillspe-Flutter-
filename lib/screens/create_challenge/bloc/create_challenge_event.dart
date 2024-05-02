part of 'create_challenge_bloc.dart';

@immutable
sealed class CreateChallengeEvent {}

class CreateChallengeButtonClickedEvent extends CreateChallengeEvent {
  final CreateChallengeRequest createChallengeRequest;
  final bool isEdit;
  final String? challengeID;
  CreateChallengeButtonClickedEvent(
      this.createChallengeRequest, this.isEdit, this.challengeID);
}
