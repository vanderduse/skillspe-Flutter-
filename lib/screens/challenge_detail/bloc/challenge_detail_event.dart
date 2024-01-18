part of 'challenge_detail_bloc.dart';

sealed class ChallengeDetailEvent extends Equatable {
  const ChallengeDetailEvent();

  @override
  List<Object> get props => [];
}

class ChallengeDetailInitEvent extends ChallengeDetailEvent {
  final String? challengeId;
  const ChallengeDetailInitEvent({required this.challengeId});
}
