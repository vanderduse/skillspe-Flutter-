// ignore_for_file: empty_catches

import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/service/api_client.dart';
import 'package:skills_pe/screens/create_challenge/models/create_challenge_request.dart';
import 'package:skills_pe/screens/create_challenge/models/create_challenge_response.dart';

class CreateChallengeRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<BaseResponseModel<CreateChallengeResponse>?> createUpdateChallenge(
      {required CreateChallengeRequest createChallengeRequest,
      required bool isEdit,
      required String? challengeId}) async {
    try {
      print(createChallengeRequest.toJson());
      Response? response = await _dio?.post(
          isEdit ? '/v1/challenges/$challengeId/update' : '/v1/challenges',
          data: createChallengeRequest);
      return BaseResponseModel<CreateChallengeResponse>.fromJson(
          response?.data,
          (data) =>
              CreateChallengeResponse.fromJson(data as Map<String, dynamic>));
    } on DioException catch (e) {
      return BaseResponseModel<CreateChallengeResponse>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }
}
