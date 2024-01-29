import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/view_all/repository/list_filtered_quizzes_repo.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';

part 'list_filtered_quizzes_event.dart';
part 'list_filtered_quizzes_state.dart';

class ListFilteredQuizzesBloc
    extends Bloc<ListFilteredQuizzesEvent, ListFilteredQuizzesState> {
  final ListFilteredQuizzesRepository _repository;

  ListFilteredQuizzesBloc(this._repository)
      : super(ListFilteredQuizzesInitialState()) {
    //Intial event which will be fetched on inital render
    on<FetchListFilteredQuizzesEvent>((event, emit) async {
      emit(ListFilteredQuizzesLoadingState());
      try {
        var response =
            await _repository.fetchFilteredQuizzes(event.status, event.page);
        if (response != null && response.success == true) {
          emit(ListFilteredQuizzesSuccessState(
            filteredQuizzes: response.data!,
            hasReachedMax: response.pagination?.hasNext ?? false,
          ));
        } else {
          emit(ListFilteredQuizzesFailureState(
              'Failed to fetch filtered challenges'));
        }
      } catch (e) {
        emit(ListFilteredQuizzesFailureState(
            'Failed to fetch filtered challenges: $e'));
      }
    });

    //This event will be executed on filter button click
    on<FilterButtonClickedEvent>((event, emit) async {
      emit(ListFilteredQuizzesLoadingState());
      try {
        var response =
            await _repository.fetchFilteredQuizzes(event.status, event.page);

        if (response != null && response.success == true) {
          emit(ListFilteredQuizzesSuccessState(
            filteredQuizzes: response.data!,
            hasReachedMax: response.pagination?.hasNext ?? false,
          ));
        } else {
          emit(ListFilteredQuizzesFailureState(
              'Failed to fetch filtered challenges'));
        }
      } catch (e) {
        emit(ListFilteredQuizzesFailureState(
            'Failed to fetch filtered challenges: $e'));
      }
    });
  }
}
