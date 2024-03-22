import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/home_screens/model/list_campaign_response.dart';
import 'package:skills_pe/screens/view_all/repository/campaign_list_repository.dart';
part 'campaign_list_event.dart';
part 'campaign_list_state.dart';

class CampaignListBloc extends Bloc<CampaignListEvent, CampaignListState> {
  final CampaignListRepository _repository;

  CampaignListBloc(this._repository) : super(CampaignListInitialState()) {
    on<FetchCampaignListEvent>((event, emit) async {
      try {
        var response = await _repository.fetchCampaignsList(event.page);
        if (response != null &&
            response.responseCode == "SS0200" &&
            response.data != null) {
          emit(CampaignListSuccessState(
            campaignList: response.data!,
            hasNext: response.pagination?.hasNext ?? false,
          ));
        } else {
          emit(CampaignListFailureState('Failed to fetch Campaigns'));
        }
      } catch (e) {
        emit(
            CampaignListFailureState('Failed to fetch filtered Campaigns: $e'));
      }
    });
  }
}
