import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/screens/home_screens/model/list_campaign_response.dart';
import 'package:skills_pe/service/api_client.dart';
import 'package:skills_pe/utility/constants.dart';

class CampaignListRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<BaseResponseModel<List<CampaignListResponse>>?> fetchCampaignsList(
      int page) async {
    try {
      Map<String, dynamic> queryParameters = {PAGE: page, LIMIT: 10};

      Response? response =
          await _dio?.get('/v1/campaign', queryParameters: queryParameters);

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
}
