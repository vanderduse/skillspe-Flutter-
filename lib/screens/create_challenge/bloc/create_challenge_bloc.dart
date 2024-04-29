import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/create_challenge/models/create_challenge_request.dart';
import 'package:skills_pe/screens/create_challenge/repository/create_challenge_repository.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/date_utility.dart';
part 'create_challenge_event.dart';
part 'create_challenge_state.dart';

class CreateChallengeBloc
    extends Bloc<CreateChallengeEvent, CreateChallengeState> {
  final CreateChallengeRepository _challengeRepository;
  CreateChallengeBloc(this._challengeRepository)
      : super(CreateChallengeInitialState()) {
    on<CreateChallengeButtonClickedEvent>(createChallengeButtonClickedEvent);
  }

  FutureOr<void> createChallengeButtonClickedEvent(
      CreateChallengeButtonClickedEvent event,
      Emitter<CreateChallengeState> emit) async {
    emit(CreateChallengeLoadingState());
    var res = await _challengeRepository.createUpdateChallenge(
        createChallengeRequest: event.createChallengeRequest,
        isEdit: event.isEdit,
        challengeId: event.challengeID);
    if (res!.data == null) {
      emit(CreateChallengeFailureState(errorMessage: res.message!));
    } else {
      emit(CreateChallengeSuccessState(
          successMessage: res.message!,
          challengeId: res.data!.id!,
          challengeName: res.data!.title!));
    }
  }

  String validateStartDate(String? startDate, String endDate) {
    if (startDate == null || startDate.isEmpty) {
      return ENTER_START_DATE; // Constant for error message
    } else if (isStartDateBeforeCurrentDate(startDate)) {
      return START_DATE_BEFORE_CURRENT_DATE_VALIDATION;
    } else if (startDate.isNotEmpty && endDate.isNotEmpty) {
      if (isStartDateAfterEndDate(startDate: startDate, endDate: endDate)) {
        return START_DATE_END_DATE_VALIDATION; // Constant for error message
      }
    }

    // If all checks are passed, format the date
    return getDateInISOFormat(convertStringDateFormat(
        inputFormat: DDMMYYYY_SLASH_FORMAT,
        outputFormat: YYYYMMDD_DASH_FORMAT,
        dateToBeFormatted: startDate));
  }
}
