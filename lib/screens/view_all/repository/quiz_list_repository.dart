import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/service/api_client.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';
import 'package:skills_pe/utility/constants.dart';

class QuizListRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<BaseResponseModel<List<QuizzesListResponse>>?> fetchQuizList(
      String status, int page) async {
    Map<String, dynamic> queryParameters = {
      PAGE: page,
      LIMIT: 10,
    };
    if (status != ALL.toUpperCase()) {
      queryParameters.addEntries({STATUS: status}.entries);
    }
    log(queryParameters.toString());
    try {
      Response? response =
          await _dio?.get('/v1/quizzes', queryParameters: queryParameters);
      //log(response.toString());
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
