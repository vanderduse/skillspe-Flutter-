import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/service/api_client.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';

class ListQuizzesRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<BaseResponseModel<List<QuizzesListResponse>>?> fetchQuizzes() async {
    try {
      Response? response = await _dio?.get('/v1/quizzes?page=1&limit=5');

      return BaseResponseModel<List<QuizzesListResponse>>.fromJson(
        response?.data,
        (data) {
          if (data is List<dynamic>) {
            return data
                .map((item) =>
                    QuizzesListResponse.fromJson(item as Map<String, dynamic>))
                .toList();
          } else {
            return []; // Handle the case where the response data is not a list
          }
        },
      );
    } on DioException catch (e) {
      return BaseResponseModel<List<QuizzesListResponse>>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }
}
