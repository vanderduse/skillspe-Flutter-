part of 'create_challenge_bloc.dart';

@immutable
sealed class CreateChallengeState {}

class CreateChallengeInitialState extends CreateChallengeState {}

class CreateChallengeLoadingState extends CreateChallengeState {}

class CreateChallengeSuccessState extends CreateChallengeState {}

class CreateChallengeFailureState extends CreateChallengeState {}
