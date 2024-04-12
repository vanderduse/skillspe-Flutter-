import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/service/api_client.dart';
import 'package:skills_pe/screens/home_screens/model/list_private_challenges_response.dart';
import 'package:skills_pe/utility/constants.dart';

class PrivateChallengesListRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<BaseResponseModel<List<PrivateChallengesListResponse>>?> fetchPrivateChallengesList(
      String status, int page) async {
    try {
      Map<String, dynamic> queryParameters = {
        PAGE: page,
        LIMIT: 10,
      };
      if (status != "ALL") {
        queryParameters["status"] = status;
      }
      Response? response = await _dio?.get('/v1/feed/private/challenges',
          queryParameters: queryParameters);
      return BaseResponseModel<List<PrivateChallengesListResponse>>.fromJson(
        response?.data,
        (data) {
          if (data is List<dynamic>) {
            return data
                .map((item) => PrivateChallengesListResponse.fromJson(
                    item as Map<String, dynamic>))
                .toList();
          } else {
            return []; // Handle the case where the response data is not a list
          }
        },
      );
    } on DioException catch (e) {
      return BaseResponseModel<List<PrivateChallengesListResponse>>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }
}
