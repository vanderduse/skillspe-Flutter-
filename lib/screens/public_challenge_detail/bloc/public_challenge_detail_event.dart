part of 'public_challenge_detail_bloc.dart';

@immutable
sealed class PublicChallengeDetailEvent {}

class ConfirmBidEvent extends PublicChallengeDetailEvent {
  final int bidAmount;
  final PublicOptions bidOptions;
  final String challengeId;
  final ParticipantDetailResponse? participantsDetails;
  ConfirmBidEvent(
      {required this.challengeId,
      required this.bidAmount,
      required this.bidOptions,
      required this.participantsDetails});
}

class GetChallengeDetailEvent extends PublicChallengeDetailEvent {
  final String? challengeId;
  GetChallengeDetailEvent(this.challengeId);
}

class GetBidAggregate extends PublicChallengeDetailEvent {
  final String? challengeId;
  GetBidAggregate(this.challengeId);
}

class PortfolioDataEvent extends PublicChallengeDetailEvent {
  final String challengeId;
  PortfolioDataEvent({required this.challengeId});
}
