import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';
import 'package:skills_pe/screens/home_screens/repository/list_quizzes_repo.dart';

part 'list_quizzes_event.dart';
part 'list_quizzes_state.dart';

class ListQuizzesBloc extends Bloc<ListQuizzesEvent, ListQuizzesState> {
  final ListQuizzesRepository _repository;

  ListQuizzesBloc(this._repository) : super(ListQuizzesInitialState()) {
    on<FetchListQuizzesEvent>(_fetchListQuizzesEvent);
  }

  Future<void> _fetchListQuizzesEvent(
      FetchListQuizzesEvent event, Emitter<ListQuizzesState> emit) async {
    emit(ListQuizzesLoadingState());
    try {
      var response = await _repository.fetchQuizzes();
      if (response != null && response.success == true) {
        emit(ListQuizzesSuccessState(response.data!));
      } else {
        emit(ListQuizzesFailureState('Failed to fetch Quizzes'));
      }
    } catch (e) {
      emit(ListQuizzesFailureState('Failed to fetch Quizzes: $e'));
    }
  }
}
