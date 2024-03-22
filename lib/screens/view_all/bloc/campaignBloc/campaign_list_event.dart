part of 'campaign_list_bloc.dart';

abstract class CampaignListEvent {}

class FetchCampaignListEvent extends CampaignListEvent {
  final int page;

  FetchCampaignListEvent({required this.page});
}
