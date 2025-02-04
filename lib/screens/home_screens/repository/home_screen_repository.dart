import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/screens/home_screens/model/list_banners_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_private_challenges_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_public_challenges_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_tournaments_response.dart';
import 'package:skills_pe/service/api_client.dart';
import 'package:skills_pe/utility/constants.dart';
import '../model/list_campaign_response.dart';

class HomeScreenRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<BaseResponseModel<List<PrivateChallengesListResponse>>?>
      fetchPrivateChallenges() async {
    try {
      Map<String, dynamic> queryParameters = {PAGE: 1, LIMIT: 5};
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

  Future<BaseResponseModel<List<PublicChallengesItemResponse>>?>
      fetchPublicChallenges() async {
    try {
      Map<String, dynamic> queryParameters = {PAGE: 1, LIMIT: 5};
      Response? response = await _dio?.get('/v1/feed/public/challenges',
          queryParameters: queryParameters);
      return BaseResponseModel<List<PublicChallengesItemResponse>>.fromJson(
        response?.data,
        (data) {
          if (data is List<dynamic>) {
            return data
                .map((item) => PublicChallengesItemResponse.fromJson(
                    item as Map<String, dynamic>))
                .toList();
          } else {
            return []; // Handle the case where the response data is not a list
          }
        },
      );
    } on DioException catch (e) {
      return BaseResponseModel<List<PublicChallengesItemResponse>>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }

  Future<BaseResponseModel<List<QuizzesListResponse>>?> fetchQuizzes() async {
    try {
      Map<String, dynamic> queryParameters = {PAGE: 1, LIMIT: 5};
      Response? response =
          await _dio?.get('/v1/feed/quiz', queryParameters: queryParameters);
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

  Future<BaseResponseModel<List<CampaignListResponse>>?>
      fetchChampaign() async {
    try {
      Map<String, dynamic> queryParameters = {PAGE: 1, LIMIT: 5};
      Response? response = await _dio?.get('/v1/feed/campaigns',
          queryParameters: queryParameters);
      return BaseResponseModel<List<CampaignListResponse>>.fromJson(
        response?.data,
        (data) {
          if (data is List<dynamic>) {
            return data
                .map((item) =>
                    CampaignListResponse.fromJson(item as Map<String, dynamic>))
                .toList();
          } else {
            return []; // Handle the case where the response data is not a list
          }
        },
      );
    } on DioException catch (e) {
      return BaseResponseModel<List<CampaignListResponse>>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }

  Future<BaseResponseModel<List<TournamentsListResponse>>?>
      fetchTournaments() async {
    try {
      Map<String, dynamic> queryParameters = {PAGE: 1, LIMIT: 5};
      Response? response = await _dio?.get('/v1/cumulated/tournaments',
          queryParameters: queryParameters);
      return BaseResponseModel<List<TournamentsListResponse>>.fromJson(
        response?.data,
        (data) {
          if (data is List<dynamic>) {
            return data
                .map((item) => TournamentsListResponse.fromJson(
                    item as Map<String, dynamic>))
                .toList();
          } else {
            return []; // Handle the case where the response data is not a list
          }
        },
      );
    } on DioException catch (e) {
      return BaseResponseModel<List<TournamentsListResponse>>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }

  Future<BaseResponseModel<List<BannersListResponse>>?> fetchBanners() async {
    try {
      Map<String, dynamic> queryParameters = {PAGE: 1, LIMIT: 5};
      Response? response = await _dio?.get('/v1/banners?limit=10',
          queryParameters: queryParameters);
      return BaseResponseModel<List<BannersListResponse>>.fromJson(
        response?.data,
        (data) {
          if (data is List<dynamic>) {
            return data
                .map((item) =>
                    BannersListResponse.fromJson(item as Map<String, dynamic>))
                .toList();
          } else {
            return []; // Handle the case where the response data is not a list
          }
        },
      );
    } on DioException catch (e) {
      return BaseResponseModel<List<BannersListResponse>>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }
}
