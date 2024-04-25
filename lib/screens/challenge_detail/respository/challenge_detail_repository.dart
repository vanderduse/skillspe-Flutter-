import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/screens/challenge_detail/model/challenge_detail_response.dart';
import 'package:skills_pe/screens/challenge_detail/model/users_list_response.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/screens/challenge_detail/model/participant_detail_response.dart';
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

  Future<bool> inviteUsers({
    required String challengeId,
    required String participantType,
    required List<String> userIds,
  }) async {
    try {
      final data = {
        "participant_type": participantType,
        "user_id": userIds,
      };
      Response<dynamic> response = await _dio!.post(
        '/v1/challenges/$challengeId/invite',
        data: data,
      );
      // Check the response status code and return true if successful
      return response.statusCode == 200;
    } on DioException catch (e) {
      // Handle DioError if needed
      return false;
    }
  }

  Future<BaseResponseModel<List<ParticipantDetailResponse>>>
      getParticipantsList(String challengeId, String query) async {
    try {
      Map<String, dynamic> queryParameters = {TYPE: query};
      Response? response = await _dio?.get(
          '/v1/challenges/$challengeId/participants',
          queryParameters: queryParameters);
      return BaseResponseModel<List<ParticipantDetailResponse>>.fromJson(
          response?.data, (data) {
        if (data is List) {
          return data
              .map((item) => ParticipantDetailResponse.fromJson(
                  item as Map<String, dynamic>))
              .toList();
        } else {
          return [];
        }
      });
    } on DioException catch (e) {
      return BaseResponseModel<List<ParticipantDetailResponse>>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }
}
