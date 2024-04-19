part of 'challenge_detail_bloc.dart';

abstract class ChallengeDetailEvent {}

class ChallengeDetailInitEvent extends ChallengeDetailEvent {
  final String? challengeId;
  ChallengeDetailInitEvent({required this.challengeId});
}

class ChallengeDetailFetchUsersListEvent extends ChallengeDetailEvent {
  final String userType;
  ChallengeDetailFetchUsersListEvent({required this.userType});
}
