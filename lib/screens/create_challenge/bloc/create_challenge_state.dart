part of 'create_challenge_bloc.dart';

@immutable
sealed class CreateChallengeState {}

class CreateChallengeInitialState extends CreateChallengeState {}

class CreateChallengeLoadingState extends CreateChallengeState {}

class CreateChallengeSuccessState extends CreateChallengeState {
  final String successMessage;
  CreateChallengeSuccessState({required this.successMessage});
}

class CreateChallengeFailureState extends CreateChallengeState {
  final String errorMessage;
  CreateChallengeFailureState({required this.errorMessage});
}
