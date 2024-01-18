import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/screens/challenge_detail/model/challenge_detail_response.dart';
import '../../../service/api_client.dart';

class ChallengeDetailRepository {
  final Dio? _dio = ApiClient.createDio();

  // Future<BaseResponseModel<List<ChallengeDetailList>>>
  //     getChallengeDetails() async {
  //   try {
  //     Response? response = await _dio?.get('/v1/challenges');
  //     return BaseResponseModel<List<ChallengeDetailList>>.fromJson(
  //         response?.data, (data) {
  //       if (data is List) {
  //         return data
  //             .map((item) =>
  //                 ChallengeDetailList.fromJson(item as Map<String, dynamic>))
  //             .toList();
  //       } else {
  //         return [];
  //       }
  //     });
  //   } on DioException catch (e) {
  //     return BaseResponseModel<List<ChallengeDetailList>>.fromJson(
  //         e.response?.data as Map<String, dynamic>, (data) => null);
  //   }
  // }

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
}
