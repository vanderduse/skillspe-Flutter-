part of 'public_challenges_list_bloc.dart';

abstract class PublicChallengesListEvent {}

class FetchPublicChallengesListEvent extends PublicChallengesListEvent {
  final String status;
  final int page;
  FetchPublicChallengesListEvent({required this.status, required this.page});
}
