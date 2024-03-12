import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/view_all/repository/quiz_list_repository.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/buttons/filter_buttons.dart';
import 'package:skills_pe/sharedWidgets/cards/quiz_card.dart';
import 'package:skills_pe/screens/view_all/bloc/quizBloc/quiz_list_bloc.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/sharedWidgets/skeletonLoaders/quiz_card_skeleton.dart';

class QuizListScreen extends StatefulWidget {
  const QuizListScreen({super.key});

  @override
  _QuizListScreenState createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  late QuizListBloc _quizListBloc;
  List<QuizzesListResponse> _quizList = [];
  final ScrollController _scrollController = ScrollController();
  String selectedFilter = "";
  int _pageNumber = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _quizListBloc = QuizListBloc(QuizListRepository());
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
    _quizListBloc.add(FetchQuizListEvent(
      page: _pageNumber, // Default page
    ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    _quizListBloc.add(FetchQuizListEvent(
      status: selectedFilter.toUpperCase(), // Default status
      page: ++_pageNumber, // Default page
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Filter button names
    List<String> filterButtonNames = [ALL, LIVE, UPCOMING];

    return Scaffold(
      appBar: AppbarWithBack(
        screenName: 'Quizzes',
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
                _quizList.clear();
                _pageNumber = 1;
                _quizListBloc.add(FetchQuizListEvent(
                    status: selectedFilter.toUpperCase(), page: _pageNumber));
              },
            ),
          ),
          BlocBuilder<QuizListBloc, QuizListState>(
            bloc: _quizListBloc,
            builder: (context, state) {
              if (state is QuizListSuccessState) {
                if (state.quizList.isNotEmpty || _quizList.isNotEmpty) {
                  log(_quizList.toString());
                  _quizList.addAll(state.quizList);
                  _isLoading = false;
                  return Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: _quizList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < _quizList.length) {
                        return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            height: 230,
                            child: QuizCard(
                              item: _quizList[index],
                            ));
                      } else if (state.hasNext) {
                        return Column(
                          children: List.generate(
                              2, (index) => const QuizCardSkeleton()),
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
                      "No Tournaments Available",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  );
                }
              } else if (state is QuizListFailureState) {
                return Text('Error: ${state.errorMessage}');
              } else {
                return Column(
                  children:
                      List.generate(2, (index) => const QuizCardSkeleton()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
