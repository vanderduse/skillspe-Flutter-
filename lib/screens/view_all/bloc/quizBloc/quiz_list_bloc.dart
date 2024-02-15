import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/view_all/repository/quiz_list_repository.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';

part 'quiz_list_event.dart';
part 'quiz_list_state.dart';

class QuizListBloc extends Bloc<FetchQuizListEvent, QuizListState> {
  final QuizListRepository _repository;

  QuizListBloc(this._repository) : super(QuizListInitialState()) {
    //Intial event which will be fetched on inital render
    on<FetchQuizListEvent>((event, emit) async {
      try {
        var response =
            await _repository.fetchQuizList(event.status, event.page);
        if (response != null &&
            response.success == true &&
            response.data != null) {
          emit(QuizListSuccessState(
            quizList: response.data!,
            hasNext: response.pagination?.hasNext ?? false,
          ));
        } else {
          emit(QuizListFailureState('Failed to fetch filtered challenges'));
        }
      } catch (e) {
        emit(QuizListFailureState('Failed to fetch filtered challenges: $e'));
      }
    });
  }
}
