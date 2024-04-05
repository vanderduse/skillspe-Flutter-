import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/home_screens/ui/widgets/challenge_card_factory.dart';
import 'package:skills_pe/screens/view_all/repository/challenges_list_repository.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/buttons/filter_buttons.dart';
import 'package:skills_pe/sharedWidgets/cards/live_challenge_card.dart';
import 'package:skills_pe/screens/view_all/bloc/challengesBloc/challenges_list_bloc.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';
import 'package:skills_pe/sharedWidgets/skeletonLoaders/challenge_card_skeleton.dart';
import 'package:skills_pe/utility/constants.dart';

class ChallengesListScreen extends StatefulWidget {
  const ChallengesListScreen({super.key});

  @override
  _ChallengesListScreenState createState() => _ChallengesListScreenState();
}

class _ChallengesListScreenState extends State<ChallengesListScreen> {
  late ChallengesListBloc _challengesListBloc;
  List<ChallengesListResponse> challengesList = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _pageNumber = 1;
  String selectedFilter = ALL.toUpperCase();

  @override
  void initState() {
    super.initState();
    _challengesListBloc = ChallengesListBloc(ChallengesListRepository());
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
    _challengesListBloc.add(FetchChallengesListEvent(
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
    _challengesListBloc.add(FetchChallengesListEvent(
      status: selectedFilter, // Default status
      page: ++_pageNumber, // Default page
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Filter button names
    List<String> filterButtonNames = [ALL, LIVE, REQUEST, UPCOMING, COMPLETED];

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
              buttonNames: filterButtonNames,
              onItemSelected: (index) {
                selectedFilter = filterButtonNames[index];
                challengesList.clear();
                _pageNumber = 1;
                _challengesListBloc.add(FetchChallengesListEvent(
                    status: selectedFilter.toUpperCase(), page: _pageNumber));
              },
            ),
          ),
          BlocBuilder<ChallengesListBloc, ChallengesListState>(
            bloc: _challengesListBloc,
            builder: (context, state) {
              if (state is ChallengesListSuccessState) {
                if (state.challengesList.isNotEmpty ||
                    challengesList.isNotEmpty) {
                  // log(challengesList.toString());
                  challengesList.addAll(state.challengesList);
                  _isLoading = false;
                  return Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: challengesList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < challengesList.length) {
                        final challengeCard =
                            _getChallengeCard(challengesList[index]);
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                          height: 200,
                          child: challengeCard,
                        );
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
              } else if (state is ChallengesListFailureState) {
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

  Widget _getChallengeCard(ChallengesListResponse item) {
    final factory =
        ChallengeCardFactory.getChallengeCardFactory(item?.status ?? "");
    return factory.createChallengeCard(item); // Return Widget directly
  }
}
