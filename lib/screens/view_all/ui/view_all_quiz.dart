import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/filter_buttons.dart';
import 'package:skills_pe/sharedWidgets/quiz_card.dart';

import 'package:skills_pe/screens/view_all/bloc/list_filtered_quizzes_bloc.dart';
import 'package:skills_pe/screens/view_all/repository/list_filtered_quizzes_repo.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';
import 'package:skills_pe/sharedWidgets/skeletonLoaders/box_with_title.dart';

class ViewAllQuizzes extends StatefulWidget {
  const ViewAllQuizzes({super.key});

  @override
  _ViewAllQuizzesState createState() => _ViewAllQuizzesState();
}

class _ViewAllQuizzesState extends State<ViewAllQuizzes> {
  late ListFilteredQuizzesBloc _listFilteredQuizzesBloc;
  late List<QuizzesListResponse> filteredQuizzes;

  @override
  void initState() {
    super.initState();
    _listFilteredQuizzesBloc =
        ListFilteredQuizzesBloc(ListFilteredQuizzesRepository());

    _listFilteredQuizzesBloc.add(FetchListFilteredQuizzesEvent(
      status: 'ALL', // Default status
      page: 1, // Default page
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Filter button names
    List<String> filterButtonNames = ['All', 'Live', 'Upcoming'];

    return Scaffold(
      appBar: AppbarWithBack(
        screenName: 'Challenges',
        walletAmount: 100.00,
      ),
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
                  String selectedStatus = filterButtonNames[index];
                  _listFilteredQuizzesBloc.add(FilterButtonClickedEvent(
                      status: selectedStatus.toUpperCase(), page: 1));
                },
              ),
            ),
            
            BlocBuilder<ListFilteredQuizzesBloc,
                ListFilteredQuizzesState>(
              bloc: _listFilteredQuizzesBloc,
              builder: (context, state) {
                if (state is ListFilteredQuizzesLoadingState) {
                  return ShimmerBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 200,
                      showTitleContainer: true);
                } else if (state is ListFilteredQuizzesSuccessState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.filteredQuizzes.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        height: 240,
                        child: QuizCard(
                          item: state.filteredQuizzes[index],
                        ),
                      );
                    },
                  );
                } else if (state is ListFilteredQuizzesFailureState) {
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
