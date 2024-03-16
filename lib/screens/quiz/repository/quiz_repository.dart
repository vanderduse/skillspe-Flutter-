import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/screens/quiz/model/play_quiz_response_model.dart';
import 'package:skills_pe/screens/quiz/model/quiz_information_response_model.dart';
import 'package:skills_pe/screens/quiz/model/quiz_submission_request_model.dart';
import 'package:skills_pe/screens/quiz/model/quiz_submit_response_model.dart';
import 'package:skills_pe/service/api_client.dart';

class QuizRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<BaseResponseModel<QuizInformationResponseModel>?> quizInformation(
      String quizId) async {
    late BaseResponseModel<QuizInformationResponseModel> responseModel;
    try {
      Response? response = await _dio?.get('/v1/quizzes/$quizId');
      responseModel = BaseResponseModel<QuizInformationResponseModel>.fromJson(
          response?.data,
          (data) => QuizInformationResponseModel.fromJson(
              data as Map<String, dynamic>));
      responseModel.responseCode = "SS0200";
    } on DioException catch (error) {
      responseModel = BaseResponseModel<QuizInformationResponseModel>.fromJson(
          error.response?.data as Map<String, dynamic>, (data) => null);
      responseModel.responseCode = "SS0500";
    }
    return responseModel;
  }

  Future<BaseResponseModel<PlayQuizResponseModel>?> playQuizDetail(
      String quizId) async {
    try {
      Response? response = await _dio?.post('/v1/quizzes/$quizId/play');
      return BaseResponseModel<PlayQuizResponseModel>.fromJson(
          response?.data,
          (data) =>
              PlayQuizResponseModel.fromJson(data as Map<String, dynamic>));
    } on DioException catch (error) {
      return BaseResponseModel<PlayQuizResponseModel>.fromJson(
          error.response?.data as Map<String, dynamic>, (data) => null);
    }
  }

  Future<BaseResponseModel<QuizSubmissionResponseModel>?> quizSubmission(
      String quizId, String quizMetaData) async {
    try {
      Response? response = await _dio?.post('/v1/quizzes/$quizId/submit',
          data: QuizSubmissionRequestModel(meta: Meta(quizQA: quizMetaData)));
      return BaseResponseModel<QuizSubmissionResponseModel>.fromJson(
          response?.data,
          (data) => QuizSubmissionResponseModel.fromJson(
              data as Map<String, dynamic>));
    } on DioException catch (error) {
      return BaseResponseModel<QuizSubmissionResponseModel>.fromJson(
          error.response?.data as Map<String, dynamic>, (data) => null);
    }
  }
}
