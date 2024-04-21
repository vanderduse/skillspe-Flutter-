import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/screens/challenge_detail/model/challenge_detail_response.dart';
import 'package:skills_pe/screens/challenge_detail/model/users_list_response.dart';
import 'package:skills_pe/utility/constants.dart';
import '../../../service/api_client.dart';

class ChallengeDetailRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<BaseResponseModel<ChallengeDetailResponse>> getChallengeDetails(
      String challengeId) async {
    try {
      Response? response = await _dio?.get('/v1/challenges/$challengeId');
      return BaseResponseModel<ChallengeDetailResponse>.fromJson(
          response?.data,
          (data) =>
              ChallengeDetailResponse.fromJson(data as Map<String, dynamic>));
    } on DioException catch (e) {
      return BaseResponseModel<ChallengeDetailResponse>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }

  Future<BaseResponseModel<List<UsersListResponse>>> getUsersList(
      String userType) async {
    try {
      Response? response =
          await _dio?.get('/v1/participants/$userType/suggestions');
      return BaseResponseModel<List<UsersListResponse>>.fromJson(
        response?.data,
        (data) {
          if (data is List<dynamic>) {
            return data
                .map((item) =>
                    UsersListResponse.fromJson(item as Map<String, dynamic>))
                .toList();
          } else {
            return []; // Handle the case where the response data is not a list
          }
        },
      );
    } on DioException catch (e) {
      return BaseResponseModel<List<UsersListResponse>>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }

  Future<Object?> inviteUsers({
    required String challengeId,
    required String participantType,
    required List<String> userIds,
  }) async {
    try {
      final data = {
        "participant_type": participantType,
        "user_id": userIds,
      };
      BaseResponseModel? response = (await _dio?.post(
        '/v1/challenges/$challengeId/invite',
        data: data,
      )) as BaseResponseModel?;
      return response?.responseCode == API_SUCCESS_CODE;
    } on DioException catch (e) {
      return false;
    }
  }
}
