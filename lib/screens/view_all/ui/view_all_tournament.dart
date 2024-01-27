import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/filter_buttons.dart';
import 'package:skills_pe/sharedWidgets/tournament_card.dart';

class ViewAllTournament extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy wallet amount for demonstration
    double dummyWalletAmount = 100.0;
    // Filter button names
    List<String> filterButtonNames = ['All', 'Live', 'Upcoming'];

    // Dummy list of challenge data for demonstration
    List<Map<String, dynamic>> quiz = [
      {
        'title': 'Tournament Name',
        'image':
            'https://static.vecteezy.com/system/resources/previews/001/988/091/non_2x/cricket-championship-tournament-free-vector.jpg',
        'type': 'Motivator',
        'date': 'Jun 30 - Jul 30, 2023',
        // Add more properties as needed
      },
      {
        'title': 'Tournament Name',
        'image':
            'https://static.vecteezy.com/system/resources/previews/001/988/091/non_2x/cricket-championship-tournament-free-vector.jpg',
        'type': 'Motivator',
        'date': 'Jun 30 - Jul 30, 2023',
        // Add more properties as needed
      },
      {
        'title': 'Tournament Name',
        'image':
            'https://static.vecteezy.com/system/resources/previews/001/988/091/non_2x/cricket-championship-tournament-free-vector.jpg',
        'type': 'Motivator',
        'date': 'Jun 30 - Jul 30, 2023',
        // Add more properties as needed
      },
    ];

    return Scaffold(
      appBar: AppbarWithBack(
        screenName: 'Challenges',
        walletAmount: dummyWalletAmount,
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
                  // Handle filter button selection here
                  print('Selected filter index: $index');
                },
              ),
            ),

            // Tounaments cards - Vertical ListView
          
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: quiz.length,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       margin: EdgeInsets.symmetric(horizontal: 20.0),
            //       height: 450, // Set a fixed height or adjust as needed
            //       child: TournamentCard(
            //         item: quiz[index],
            //         // Add your custom leftBorderColor if needed
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
