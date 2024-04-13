part of 'private_challenges_list_bloc.dart';

abstract class PrivateChallengesListEvent {}

class FetchPrivateChallengesListEvent extends PrivateChallengesListEvent {
  final String status;
  final int page;
  FetchPrivateChallengesListEvent({required this.status, required this.page});
}
