part of 'challenge_detail_bloc.dart';

sealed class ChallengeDetailState extends Equatable {
  const ChallengeDetailState();

  @override
  List<Object> get props => [];
}

final class ChallengeDetailLoadingState extends ChallengeDetailState {}

final class ChallengeDetailFailureState extends ChallengeDetailState {
  final String errorMessage;
  ChallengeDetailFailureState({required this.errorMessage});
}

final class ChallengeDetailSuccessState extends ChallengeDetailState {
  final ChallengeDetailResponse challengeDetailResponse;
  const ChallengeDetailSuccessState({required this.challengeDetailResponse});
}
