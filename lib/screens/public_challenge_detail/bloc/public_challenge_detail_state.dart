part of 'public_challenge_detail_bloc.dart';

sealed class PublicChallengeDetailState extends Equatable {
  const PublicChallengeDetailState();
  
  @override
  List<Object> get props => [];
}

final class PublicChallengeDetailInitial extends PublicChallengeDetailState {}
