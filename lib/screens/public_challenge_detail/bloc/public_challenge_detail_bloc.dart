import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/screens/challenge_detail/model/participant_detail_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_public_challenges_response.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/bid_aggregate_item.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/bidding_history_item.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/challenge_portfolio_detail_response.dart';
import 'package:skills_pe/screens/public_challenge_detail/repository/public_challenge_detail_repository.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/response_code.dart';

part 'public_challenge_detail_event.dart';
part 'public_challenge_detail_state.dart';

class PublicChallengeDetailBloc
    extends Bloc<PublicChallengeDetailEvent, PublicChallengeDetailState> {
  final PublicChallengeDetailRepository _challengeDetailRepository;
  int calculatedValue = 0, biddingValue = 0;
  PublicChallengeDetailBloc(this._challengeDetailRepository)
      : super(PublicChallengeDetailInitialState()) {
    on<GetBidAggregate>((event, emit) async {
      emit(GetBidAggregateLoadingState());
      try {
        final response =
            await _challengeDetailRepository.getBidAggregate(event.challengeId);
        if (response.responseCode == ResponseCode.success &&
            response.data != null) {
          emit(GetBidAggregateSuccessState(response.data));
        } else if (response.message != null) {
          emit(GetBidAggregateFailureState(response.message!));
        } else {
          emit(GetBidAggregateFailureState(COMMON_ERROR_MESSAGE));
        }
      } catch (e) {
        emit(GetBidAggregateFailureState(COMMON_ERROR_MESSAGE));
      }
    });

    on<ConfirmBidEvent>((event, emit) async {
      emit(ConfirmBidLoadingState());
      try {
        if (event.participantsDetails != null) {
          final participantResponse = await _challengeDetailRepository
              .addParticipants(event.challengeId);
          if (participantResponse.responseCode != ResponseCode.created &&
              participantResponse.message != null) {
            emit(ConfirmBidFailureState(participantResponse.message!));
            return;
          }
        }
        final response = await _challengeDetailRepository.confirmBid(
            event.challengeId, event.bidAmount, event.bidOptions);
        if (response.responseCode == ResponseCode.created &&
            response.data != null) {
          emit(ConfirmBidSuccessState());
        } else if (response.responseCode == ResponseCode.insuffientBalance &&
            response.message != null) {
          emit(ConfirmBidFailureState(response.message!));
        } else {
          emit(ConfirmBidFailureState(BIDDING_FAILED_MESSAGE));
        }
      } catch (e) {
        emit(ConfirmBidFailureState(BIDDING_FAILED_MESSAGE));
      }
    });

    on<PortfolioDataEvent>((event, emit) async {
      emit(PortfolioLoadingState());
      try {
        final results = await Future.wait([
          _challengeDetailRepository.getPortfolioDetail(event.challengeId),
          _challengeDetailRepository.getBiddingHistory(event.challengeId),
        ]);
        final portfolioDetail =
            results[0] as BaseResponseModel<ChallengePortfolioDetailResponse>;
        final biddingHistoryList =
            results[1] as BaseResponseModel<List<BiddingHistoryItem>>;

        portfolioDetail.data ??= null;
        biddingHistoryList.data ??= [];

        if (portfolioDetail.data == null && biddingHistoryList.data!.isEmpty) {
          emit(PortfolioResponseFailureState(COMMON_ERROR_MESSAGE));
        } else {
          emit(PortfolioResponseSuccessState(
              portfolioDetail.data!, biddingHistoryList.data!));
        }
      } catch (e) {
        emit(PortfolioResponseFailureState(COMMON_ERROR_MESSAGE));
      }
    });

    on<GetChallengeDetailEvent>((event, emit) async {
      emit(GetChallengeDetailLoadingState());
      try {
        final response = await _challengeDetailRepository
            .getChallengeDetails(event.challengeId);
        if (response.responseCode == ResponseCode.success &&
            response.data != null) {
          emit(GetChallengeDetailSuccessState(response.data));
        } else if (response.message != null) {
          emit(GetChallengeDetailFailureState(response.message!));
        } else {
          emit(GetChallengeDetailFailureState(COMMON_ERROR_MESSAGE));
        }
      } catch (e) {
        emit(GetChallengeDetailFailureState(COMMON_ERROR_MESSAGE));
      }
    });
  }

  int calculateBiddingValue(
      List<PublicOptions>? options, String? activeCard, double sliderValue) {
    biddingValue = options
            ?.firstWhere((element) => element.label == activeCard)
            .bidValue
            ?.toInt() ??
        0;
    calculatedValue = sliderValue.toInt() * biddingValue;
    return calculatedValue;
  }

  int calculateWinUpTo(
      List<PublicOptions>? options, String? activeCard, double sliderValue) {
    int value = options
            ?.firstWhere((element) => element.label != activeCard)
            .bidValue
            ?.toInt() ??
        0;
    int amount = sliderValue.toInt() * value;
    return amount;
  }

  PublicOptions getBidOption(List<PublicOptions>? options, String? activeCard) {
    return options?.firstWhere((element) => element.label == activeCard) ??
        PublicOptions();
  }

  bool isLiveStatus(String? status) {
    return status?.toLowerCase() == LIVE.toLowerCase();
  }

  String getBidValueLabel(String? status) {
    switch (status?.toLowerCase()) {
      case 'live':
        return YOUR_ARE_CONTRIBUTING;
      case 'completed':
        return YOU_CONTRIBUTED;
      case 'results_pending':
        return YOU_CONTRIBUTED;
      default:
        return YOUR_ARE_CONTRIBUTING;
    }
  }

  String getBidReturnLabel(String? status) {
    switch (status?.toLowerCase()) {
      case 'live':
        return WIN_UPTO;
      case 'completed':
        return YOUR_RETURNS;
      case 'results_pending':
        return TOTAL_QUANTITY;
      default:
        return WIN_UPTO;
    }
  }
}
