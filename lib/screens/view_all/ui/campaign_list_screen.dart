import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/home_screens/model/list_campaign_response.dart';
import 'package:skills_pe/screens/view_all/bloc/campaignBloc/campaign_list_bloc.dart';
import 'package:skills_pe/screens/view_all/repository/campaign_list_repository.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/cards/campaigns_card.dart';
import 'package:skills_pe/sharedWidgets/skeletonLoaders/campaign_card_skeleton.dart';
import 'package:skills_pe/utility/constants.dart';

class CampaignListScreen extends StatefulWidget {
  const CampaignListScreen({super.key});

  @override
  _CampaignListScreenState createState() => _CampaignListScreenState();
}

class _CampaignListScreenState extends State<CampaignListScreen> {
  late CampaignListBloc _champaignListBloc;
  final List<CampaignListResponse> _campaignList = [];
  final ScrollController _scrollController = ScrollController();
  int _pageNumber = 1;
  bool _isLoading = false;
  final List<String> leftBorderColors = [
    '#ED5E91',
    '#5241AC',
    '#DA5EED',
    '#ffc800',
    '#00b6bd',
    '#0dbd00',
    '#9d00bd',
  ];

  @override
  void initState() {
    super.initState();
    _champaignListBloc = CampaignListBloc(CampaignListRepository());
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        // Load more data when scrolled to the bottom
        if (!_isLoading) {
          _isLoading = true;
          _loadMoreData();
        }
      }
    });
    _champaignListBloc.add(FetchCampaignListEvent(
      page: _pageNumber, // Default page
    ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    _champaignListBloc.add(FetchCampaignListEvent(
      page: ++_pageNumber, // Default page
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWithBack(
          screenName: CAMPAIGNS,
          walletAmount: 100.00,
        ),
        body: BlocBuilder<CampaignListBloc, CampaignListState>(
          bloc: _champaignListBloc,
          builder: (context, state) {
            if (state is CampaignListSuccessState) {
              if (state.campaignList.isNotEmpty || _campaignList.isNotEmpty) {
                log(_campaignList.toString());
                _campaignList.addAll(state.campaignList);
                _isLoading = false;
                return ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: _campaignList.length + 1,
                  itemBuilder: (context, index) {
                    if (index < _campaignList.length) {
                      String leftBorderColor =
                          leftBorderColors[index % leftBorderColors.length];
                      return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                          height: 350,
                          child: CampaignsCard(
                            key: GlobalKey(),
                            item: _campaignList[index],
                            leftBorderColor: leftBorderColor,
                          ));
                    } else if (state.hasNext) {
                      return Column(
                        children: List.generate(
                            2, (index) => const CampaignCardSkeleton()),
                      );
                    } else {
                      _isLoading = true;
                      return null;
                    }
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    "No Campaign Available",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                );
              }
            } else if (state is CampaignListFailureState) {
              return Text('Error: ${state.errorMessage}');
            } else {
              return Column(
                children:
                    List.generate(2, (index) => const CampaignCardSkeleton()),
              );
            }
          },
        ));
  }
}
