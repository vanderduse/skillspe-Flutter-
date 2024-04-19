part of 'challenge_detail_bloc.dart';

sealed class ChallengeDetailState {}

class ChallengeDetailInitialState extends ChallengeDetailState {}

class ChallengeDetailLoadingState extends ChallengeDetailState {}

class ChallengeDetailFailureState extends ChallengeDetailState {
  final String errorMessage;
  ChallengeDetailFailureState({required this.errorMessage});
}

class ChallengeDetailSuccessState extends ChallengeDetailState {
  final ChallengeDetailResponse challengeDetailResponse;
  ChallengeDetailSuccessState({required this.challengeDetailResponse});
}


class UsersListLoadingState extends ChallengeDetailState {}

class UsersListFailureState extends ChallengeDetailState {
  final String errorMessage;
  UsersListFailureState(this.errorMessage);
}

class UsersListSuccessState extends ChallengeDetailState {
  final List<UsersListResponse> usersList;
  UsersListSuccessState(this.usersList);
}
