import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/screens/home_screens/model/list_public_challenges_response.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/bid_aggregate_item.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/bidding_options.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/challenge_portfolio_detail_response.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/confirm_bid_request.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/confirm_bid_response.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/participants_request.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/participants_response.dart';
import 'package:skills_pe/service/api_client.dart';
import '../models/bidding_history_item.dart';

class PublicChallengeDetailRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<BaseResponseModel<ConfirmBidResponse>> confirmBid(
      String challengeId, int bidAmout, PublicOptions options) async {
    try {
      final confirmBidRequest = ConfirmBidRequest(
          bidAmount: bidAmout,
          bidOption: BidOptions(label: options.label, value: options.bidValue));
      Response? response = await _dio?.post('/v1/challenges/$challengeId/bid',
          data: confirmBidRequest);
      return BaseResponseModel<ConfirmBidResponse>.fromJson(response?.data,
          (data) => ConfirmBidResponse.fromJson(data as Map<String, dynamic>));
    } on DioException catch (e) {
      return BaseResponseModel<ConfirmBidResponse>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }

  Future<BaseResponseModel<PublicChallengesItemResponse>> getChallengeDetails(
      String? challengeId) async {
    try {
      Response? response = await _dio?.get('/v1/challenges/$challengeId');
      return BaseResponseModel<PublicChallengesItemResponse>.fromJson(
          response?.data,
          (data) => PublicChallengesItemResponse.fromJson(
              data as Map<String, dynamic>));
    } on DioException catch (e) {
      return BaseResponseModel<PublicChallengesItemResponse>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }

  Future<BaseResponseModel<ChallengePortfolioDetailResponse>>
      getPortfolioDetail(String gameID) async {
    try {
      Response? response = await _dio?.get('/v1/portfolio/game/$gameID');
      return BaseResponseModel<ChallengePortfolioDetailResponse>.fromJson(
          response?.data,
          (data) => ChallengePortfolioDetailResponse.fromJson(
              data as Map<String, dynamic>));
    } on DioException catch (e) {
      return BaseResponseModel<ChallengePortfolioDetailResponse>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }

  Future<BaseResponseModel<List<BiddingHistoryItem>>> getBiddingHistory(
      String challengeId) async {
    try {
      Response? response = await _dio?.get('/v1/challenges/$challengeId/bids');
      return BaseResponseModel<List<BiddingHistoryItem>>.fromJson(
        response?.data,
        (data) {
          if (data is List<dynamic>) {
            return data
                .map((item) =>
                    BiddingHistoryItem.fromJson(item as Map<String, dynamic>))
                .toList();
          } else {
            return []; // Handle the case where the response data is not a list
          }
        },
      );
    } on DioException catch (e) {
      return BaseResponseModel<List<BiddingHistoryItem>>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }

  Future<BaseResponseModel<ParticipantsResponse>> addParticipants(
      String? challengeId) async {
    try {
      Response? response = await _dio?.post(
          '/v1/challenges/$challengeId/participants',
          data: const ParticipantsRequest());
      return BaseResponseModel<ParticipantsResponse>.fromJson(
          response?.data,
          (data) =>
              ParticipantsResponse.fromJson(data as Map<String, dynamic>));
    } on DioException catch (e) {
      return BaseResponseModel<ParticipantsResponse>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }

  Future<BaseResponseModel<List<BidAggregateItem>>> getBidAggregate(
      String? challengeId) async {
    try {
      Response? response =
          await _dio?.get('/v1/challenges/$challengeId/bids/aggregate');
      return BaseResponseModel<List<BidAggregateItem>>.fromJson(
        response?.data,
        (data) {
          if (data is List<dynamic>) {
            return data
                .map((item) =>
                    BidAggregateItem.fromJson(item as Map<String, dynamic>))
                .toList();
          } else {
            return []; // Handle the case where the response data is not a list
          }
        },
      );
    } on DioException catch (e) {
      return BaseResponseModel<List<BidAggregateItem>>.fromJson(
          e.response?.data as Map<String, dynamic>, (data) => null);
    }
  }
}
