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
  final List<ParticipantDetailResponse> challengersList;
  final List<ParticipantDetailResponse> moderatorList;
  final List<ParticipantDetailResponse> motivatorList;
  ChallengeDetailSuccessState(
      {required this.challengeDetailResponse,
      required this.challengersList,
      required this.moderatorList,
      required this.motivatorList});
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

class InviteUsersLoadingState extends ChallengeDetailState {}

class InviteUsersFailureState extends ChallengeDetailState {
  final String errorMessage;
  InviteUsersFailureState(this.errorMessage);
}

class InviteUsersSuccessState extends ChallengeDetailState {}
