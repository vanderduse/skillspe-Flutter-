part of 'list_tournaments_bloc.dart';

@immutable
sealed class ListTournamentsState {}

class ListTournamentsInitialState extends ListTournamentsState {}

class ListTournamentsLoadingState extends ListTournamentsState {}

class ListTournamentsSuccessState extends ListTournamentsState {
  final List<TournamentsListResponse> tournaments;
  ListTournamentsSuccessState(this.tournaments);
}

class ListTournamentsFailureState extends ListTournamentsState {
  final String errorMessage;
  ListTournamentsFailureState(this.errorMessage);
}
