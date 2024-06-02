part of 'public_challenge_detail_bloc.dart';

@immutable
sealed class PublicChallengeDetailState {}

class PublicChallengeDetailInitialState extends PublicChallengeDetailState {}

class LoadingState extends PublicChallengeDetailState {
  final String loaderMessage = LOADING;
}

class ResponseFailureState extends PublicChallengeDetailState {
  final String errorMessage;
  ResponseFailureState(this.errorMessage);
}

class ResponseSuccessState extends PublicChallengeDetailState {}

class ConfirmBidLoadingState extends LoadingState {
  @override
  String get loaderMessage => CONFIRMING_BIDDING;
}

class ConfirmBidSuccessState extends ResponseSuccessState {
  ConfirmBidSuccessState();
}

class ConfirmBidFailureState extends ResponseFailureState {
  ConfirmBidFailureState(errorMessage) : super(errorMessage);
}

class PortfolioLoadingState extends PublicChallengeDetailState {}

class PortfolioResponseSuccessState extends ResponseSuccessState {
  final ChallengePortfolioDetailResponse portfolioDetail;
  final List<BiddingHistoryItem> biddingHistoryList;
  PortfolioResponseSuccessState(this.portfolioDetail, this.biddingHistoryList);
}

class PortfolioResponseFailureState extends PublicChallengeDetailState {
  final String errorMessage;
  PortfolioResponseFailureState(this.errorMessage);
}

class GetBidAggregateLoadingState extends LoadingState {}

class GetBidAggregateSuccessState extends ResponseSuccessState {
  final List<BidAggregateItem>? bidAggregateItem;
  GetBidAggregateSuccessState(this.bidAggregateItem);
}

class GetBidAggregateFailureState extends ResponseFailureState {
  GetBidAggregateFailureState(errorMessage) : super(errorMessage);
}

class GetChallengeDetailLoadingState extends LoadingState {}

class GetChallengeDetailSuccessState extends ResponseSuccessState {
  final PublicChallengesItemResponse? challengeDetail;
  GetChallengeDetailSuccessState(this.challengeDetail);
}

class GetChallengeDetailFailureState extends ResponseFailureState {
  GetChallengeDetailFailureState(errorMessage) : super(errorMessage);
}
