part of 'campaign_list_bloc.dart';

@immutable
sealed class CampaignListState {}

class CampaignListInitialState extends CampaignListState {}

class CampaignListSuccessState extends CampaignListState {
  final List<CampaignListResponse> campaignList;
  final bool hasNext;

  CampaignListSuccessState({
    required this.campaignList,
    required this.hasNext,
  });
}

class CampaignListFailureState extends CampaignListState {
  final String errorMessage;
  CampaignListFailureState(this.errorMessage);
}
