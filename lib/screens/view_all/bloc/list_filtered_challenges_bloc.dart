import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/view_all/repository/list_filtered_challenges_repo.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';

part 'list_filtered_challenges_event.dart';
part 'list_filtered_challenges_state.dart';

class ListFilteredChallengesBloc
    extends Bloc<ListFilteredChallengesEvent, ListFilteredChallengesState> {
  final ListFilteredChallengesRepository _repository;

  ListFilteredChallengesBloc(this._repository)
      : super(ListFilteredChallengesInitialState()) {
    //Intial event which will be fetched on inital render
    on<FetchListFilteredChallengesEvent>((event, emit) async {
      emit(ListFilteredChallengesLoadingState());
      try {
        var response =
            await _repository.fetchFilteredChallenges(event.status, event.page);
        if (response != null && response.success == true) {
          emit(ListFilteredChallengesSuccessState(
            filteredChallenges: response.data!,
            hasReachedMax: response.pagination?.hasNext ?? false,
          ));
        } else {
          emit(ListFilteredChallengesFailureState(
              'Failed to fetch filtered challenges'));
        }
      } catch (e) {
        emit(ListFilteredChallengesFailureState(
            'Failed to fetch filtered challenges: $e'));
      }
    });

    //This event will be executed on filter button click
    on<FilterButtonClickedEvent>((event, emit) async {
      emit(ListFilteredChallengesLoadingState());
      try {
        var response =
            await _repository.fetchFilteredChallenges(event.status, event.page);
        print("on button click event for status: ${event.status}");
        print("response: ${response}");

        if (response != null && response.success == true) {
          emit(ListFilteredChallengesSuccessState(
            filteredChallenges: response.data!,
            hasReachedMax: response.pagination?.hasNext ?? false,
          ));
        } else {
          emit(ListFilteredChallengesFailureState(
              'Failed to fetch filtered challenges'));
        }
      } catch (e) {
        emit(ListFilteredChallengesFailureState(
            'Failed to fetch filtered challenges: $e'));
      }
    });
  }
}
