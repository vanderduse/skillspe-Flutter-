import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/screens/challenge_detail/model/users_list_response.dart';
import 'package:skills_pe/screens/challenge_detail/model/challenge_detail_response.dart';
import 'package:skills_pe/screens/challenge_detail/model/participant_detail_response.dart';
import 'package:skills_pe/screens/challenge_detail/respository/challenge_detail_repository.dart';
import 'package:skills_pe/utility/constants.dart';
part 'challenge_detail_event.dart';
part 'challenge_detail_state.dart';

class ChallengeDetailBloc
    extends Bloc<ChallengeDetailEvent, ChallengeDetailState> {
  final ChallengeDetailRepository _challengeDetailRepository;
  ChallengeDetailBloc(this._challengeDetailRepository)
      : super(ChallengeDetailInitialState()) {
    on<ChallengeDetailInitEvent>(challengeDetailInitEvent);
    on<ChallengeDetailFetchUsersListEvent>(_fetchUsersList);
    on<ChallengeDetailInviteUsersEvent>(_inviteUsers);
  }

  FutureOr<void> challengeDetailInitEvent(ChallengeDetailInitEvent event,
      Emitter<ChallengeDetailState> emit) async {
    emit(ChallengeDetailLoadingState());
    try {
      // Parallel API calls
      final results = await Future.wait([
        _challengeDetailRepository.getChallengeDetails(event.challengeId!),
        _challengeDetailRepository.getParticipantsList(
            event.challengeId!, CHALLENGER),
        _challengeDetailRepository.getParticipantsList(
            event.challengeId!, MODERATOR),
        _challengeDetailRepository.getParticipantsList(
            event.challengeId!, MOTIVATOR),
      ]);

      // Assuming all API calls return BaseResponseModel and have a similar structure
      final challengeDetailsResponse =
          results[0] as BaseResponseModel<ChallengeDetailResponse>;
      final challengersList =
          results[1] as BaseResponseModel<List<ParticipantDetailResponse>>;
      final moderatorList =
          results[2] as BaseResponseModel<List<ParticipantDetailResponse>>;
      final motivatorList =
          results[3] as BaseResponseModel<List<ParticipantDetailResponse>>;

      if (challengeDetailsResponse.data == null) {
        throw Exception(COMMON_ERROR_MESSAGE);
      }

      final ParticipantDetailResponse inviteItem =
          ParticipantDetailResponse(firstName: INVITE);

      challengersList.data ??= [];
      moderatorList.data ??= [];
      motivatorList.data ??= [];

      challengersList.data?.insert(0, inviteItem);
      moderatorList.data?.insert(0, inviteItem);
      motivatorList.data?.insert(0, inviteItem);

      emit(ChallengeDetailSuccessState(
          challengeDetailResponse: challengeDetailsResponse.data!,
          challengersList: challengersList.data!,
          moderatorList: moderatorList.data!,
          motivatorList: motivatorList.data!));
    } on Exception catch (error) {
      emit(ChallengeDetailFailureState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _fetchUsersList(ChallengeDetailFetchUsersListEvent event,
      Emitter<ChallengeDetailState> emit) async {
    emit(UsersListLoadingState());
    try {
      var response =
          await _challengeDetailRepository.getUsersList(event.userType);
      if (response.data != null) {
        emit(UsersListSuccessState(response.data!));
      } else {
        emit(UsersListFailureState('Failed to fetch users list'));
      }
    } catch (e) {
      emit(UsersListFailureState('Failed to fetch users list: $e'));
    }
  }

  FutureOr<void> _inviteUsers(ChallengeDetailInviteUsersEvent event,
      Emitter<ChallengeDetailState> emit) async {
    emit(InviteUsersLoadingState());
    try {
      bool response = await _challengeDetailRepository.inviteUsers(
          challengeId: event.challengeId,
          participantType: event.particapantsType,
          userIds: event.userIds);
      if (response == true) {
        emit(InviteUsersSuccessState());
      } else {
        emit(InviteUsersFailureState('Failed to invite users'));
      }
    } catch (e) {
      emit(InviteUsersFailureState('Failed to invite users: $e'));
    }
  }
}
