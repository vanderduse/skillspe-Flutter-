import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/home_screens/model/list_tournaments_response.dart';
import 'package:skills_pe/screens/view_all/bloc/tournamentBloc/tournament_list_bloc.dart';
import 'package:skills_pe/screens/view_all/repository/tournament_list_repository.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/filter_buttons.dart';
import 'package:skills_pe/sharedWidgets/skeletonLoaders/box_with_title.dart';
import 'package:skills_pe/sharedWidgets/tournament_card.dart';
import 'package:skills_pe/utility/constants.dart';

class TournamentListScreen extends StatefulWidget {
  const TournamentListScreen({super.key});

  @override
  _TournamentListScreenState createState() => _TournamentListScreenState();
}

class _TournamentListScreenState extends State<TournamentListScreen> {
  late TournamentListBloc _tournamentListBloc;
  List<TournamentsListResponse> tournamentList = [];
  final ScrollController _scrollController = ScrollController();
  String selectedFilter = COMPLETED.toUpperCase();
  int _pageNumber = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tournamentListBloc = TournamentListBloc(TournamentListRepository());
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
    _tournamentListBloc.add(FetchTournamentListEvent(
      status: selectedFilter,
      page: _pageNumber, // Default page
    ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    _tournamentListBloc.add(FetchTournamentListEvent(
      status: selectedFilter.toUpperCase(), // Default status
      page: ++_pageNumber, // Default page
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Filter button names
    List<String> filterButtonNames = [COMPLETED, LIVE, UPCOMING];

    return Scaffold(
      appBar: AppbarWithBack(
        screenName: 'Tournaments',
        walletAmount: 100.00,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Filter buttons
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: ButtonGroup(
              buttonNames: filterButtonNames,
              onItemSelected: (index) {
                selectedFilter = filterButtonNames[index];
                tournamentList.clear();
                _pageNumber = 1;
                _tournamentListBloc.add(FetchTournamentListEvent(
                    status: selectedFilter.toUpperCase(), page: _pageNumber));
              },
            ),
          ),
          BlocBuilder<TournamentListBloc, TournamentListState>(
            bloc: _tournamentListBloc,
            builder: (context, state) {
              if (state is TournamentListLoadingState) {
                return ShimmerBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 180,
                    showTitleContainer: true);
              } else if (state is TournamentListSuccessState) {
                if (state.tournamentList.isNotEmpty ||
                    tournamentList.isNotEmpty) {
                  log(tournamentList.toString());
                  tournamentList.addAll(state.tournamentList);
                  _isLoading = false;
                  return Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: tournamentList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < tournamentList.length) {
                        return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Wrap(children: [
                              TournamentCard(
                                item: tournamentList[index],
                              ),
                            ]));
                      } else if (state.hasNext) {
                        return ShimmerBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 180,
                            showTitleContainer: true);
                      } else {
                        _isLoading = true;
                        return null;
                      }
                    },
                  ));
                } else {
                  return const Center(
                    child: Text(
                      "No Tournaments Available",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  );
                }
              } else if (state is TournamentListFailureState) {
                return Text('Error: ${state.errorMessage}');
              } else {
                return ShimmerBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 180,
                    showTitleContainer: true);
              }
            },
          ),
        ],
      ),
    );
  }
}
