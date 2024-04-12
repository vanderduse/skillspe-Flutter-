import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/home_screens/model/list_public_challenges_response.dart';
import 'package:skills_pe/sharedWidgets/cards/public_challenge_card.dart';
import 'package:skills_pe/screens/view_all/bloc/publicChallengesBloc/public_challenges_list_bloc.dart';
import 'package:skills_pe/screens/view_all/repository/public_challenges_list_repository.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/buttons/filter_buttons.dart';
import 'package:skills_pe/sharedWidgets/skeletonLoaders/challenge_card_skeleton.dart';
import 'package:skills_pe/utility/constants.dart';

class PublicChallengesListScreen extends StatefulWidget {
  const PublicChallengesListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PublicChallengesListScreenState createState() =>
      _PublicChallengesListScreenState();
}

class _PublicChallengesListScreenState
    extends State<PublicChallengesListScreen> {
  late PublicChallengesListBloc _publicChallengesListBloc;
  List<PublicChallengesListResponse> publicChallengesList = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _pageNumber = 1;
  String selectedFilter = ALL.toUpperCase();

  @override
  void initState() {
    super.initState();
    _publicChallengesListBloc =
        PublicChallengesListBloc(PublicChallengesListRepository());
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
    _publicChallengesListBloc.add(FetchPublicChallengesListEvent(
      status: selectedFilter, // Default status
      page: _pageNumber, // Default page
    ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    _publicChallengesListBloc.add(FetchPublicChallengesListEvent(
      status: selectedFilter, // Default status
      page: ++_pageNumber, // Default page
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Filter button names
    List<ChallengeStatus> filterButtonNames = [
      ChallengeStatus.ALL,
      ChallengeStatus.DRAFT,
      ChallengeStatus.LIVE,
      ChallengeStatus.RESULTS_PENDING,
      ChallengeStatus.COMPLETED,
      ChallengeStatus.REQUEST,
      ChallengeStatus.UPCOMING
    ];

    return Scaffold(
      appBar: AppbarWithBack(
        screenName: CHALLENGES,
        walletAmount: 100.0,
      ),
      // Rest of your Scaffold content...
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Filter buttons
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: ButtonGroup(
              buttonNames: filterButtonNames.map((ChallengeStatus status) {
                return status.displayName;
              }).toList(),
              onItemSelected: (index) {
                selectedFilter = filterButtonNames[index].label;
                publicChallengesList.clear();
                _pageNumber = 1;
                _publicChallengesListBloc.add(FetchPublicChallengesListEvent(
                    status: selectedFilter.toUpperCase(), page: _pageNumber));
              },
            ),
          ),
          BlocBuilder<PublicChallengesListBloc, PublicChallengesListState>(
            bloc: _publicChallengesListBloc,
            builder: (context, state) {
              if (state is PublicChallengesListSuccessState) {
                if (state.publicChallengesList.isNotEmpty ||
                    publicChallengesList.isNotEmpty) {
                  // log(challengesList.toString());
                  publicChallengesList.addAll(state.publicChallengesList);
                  _isLoading = false;
                  return Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: publicChallengesList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < publicChallengesList.length) {
                        return Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            height: 260,
                            child: PublicChallengeCard(
                              item: publicChallengesList[index],
                            ));
                      } else if (state.hasNext) {
                        return Column(
                          children: List.generate(
                              3, (index) => const ChallengeCardSkeleton()),
                        );
                      } else {
                        _isLoading = true;
                        return null;
                      }
                    },
                  ));
                } else {
                  return const Center(
                    child: Text(
                      "No Challenges Available",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  );
                }
              } else if (state is PublicChallengesListFailureState) {
                return Text('Error: ${state.errorMessage}');
              } else {
                return Column(
                  children: List.generate(
                      3, (index) => const ChallengeCardSkeleton()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
