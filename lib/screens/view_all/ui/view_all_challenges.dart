import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/filter_buttons.dart';
import 'package:skills_pe/sharedWidgets/challenge_card.dart';
import 'package:dio/dio.dart';

import 'package:skills_pe/screens/view_all/bloc/list_filtered_challenges_bloc.dart';
import 'package:skills_pe/screens/view_all/repository/list_filtered_challenges_repo.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';
import 'package:skills_pe/sharedWidgets/skeletonLoaders/box_with_title.dart';

class ViewAllChallenges extends StatefulWidget {
  @override
  _ViewAllChallengesState createState() => _ViewAllChallengesState();
}

class _ViewAllChallengesState extends State<ViewAllChallenges> {
  late ListFilteredChallengesBloc _listFilteredChallengesBloc;
  late Dio dio;
  List<ChallengesListResponse> challenges = [];
  late List<ChallengesListResponse> filteredChallenges;

  @override
  void initState() {
    super.initState();
    _listFilteredChallengesBloc =
        ListFilteredChallengesBloc(ListFilteredChallengesRepository());

    _listFilteredChallengesBloc.add(FetchListFilteredChallengesEvent(
      status: 'ALL', // Default status
      page: 1, // Default page
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Dummy wallet amount for demonstration
    double dummyWalletAmount = 100.0;
    // Filter button names
    List<String> filterButtonNames = [
      'All',
      'Live',
      'Request',
      'Upcoming',
      'Completed'
    ];

    return Scaffold(
      appBar: AppbarWithBack(
        screenName: 'Challenges',
        walletAmount: dummyWalletAmount,
      ),
      // Rest of your Scaffold content...
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Filter buttons
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: ButtonGroup(
                buttonNames: filterButtonNames,
                onItemSelected: (index) {
                  // Handle filter button selection here
                  String selectedStatus = filterButtonNames[index];
                  _listFilteredChallengesBloc.add(FilterButtonClickedEvent(
                      status: selectedStatus.toUpperCase(), page: 1));
                },
              ),
            ),
            BlocBuilder<ListFilteredChallengesBloc,
                ListFilteredChallengesState>(
              bloc: _listFilteredChallengesBloc,
              builder: (context, state) {
                if (state is ListFilteredChallengesLoadingState) {
                  return ShimmerBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 180,
                      showTitleContainer: true);
                } else if (state is ListFilteredChallengesSuccessState) {
                  //fetching only one card
                  filteredChallenges = state.filteredChallenges;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: filteredChallenges.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        height: 200, // Set a fixed height or adjust as needed
                        child: ChallengeCard(
                          item: filteredChallenges[index],
                          // Add your custom leftBorderColor if needed
                        ),
                      );
                    },
                  );
                } else if (state is ListFilteredChallengesFailureState) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return const Text('Unexpected state');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
