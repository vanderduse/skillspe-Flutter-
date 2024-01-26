import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/service/api_client.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';

class ListChallengeRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<BaseResponseModel<List<ChallengesListResponse>>?>
      fetchChallenges() async {
    try {
      Response? response = await _dio?.get('/v1/challenges');
      print("=============DATA=============>${response?.data!}");
      
      return BaseResponseModel<List<ChallengesListResponse>>.fromJson(
        response?.data,
        (data) {
          if (data is List<dynamic>) {
            return data
                .map((item) => ChallengesListResponse.fromJson(
                    item as Map<String, dynamic>))
                .toList();
          } else {
            return []; // Handle the case where the response data is not a list
          }
        },
      );
    } on DioException catch (e) {
      return BaseResponseModel<List<ChallengesListResponse>>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }
}
