import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/filter_buttons.dart';
import 'package:skills_pe/sharedWidgets/challenge_card.dart';

class ViewAllChallenges extends StatelessWidget {
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

    // Dummy list of challenge data for demonstration
    List<Map<String, dynamic>> challenges = [
      {
        'title':
            'Lorem ipsum dolor sit amet consectetur. GdhEst dolor sit amet consectetur',
        'icon': 'https://cdn-icons-png.flaticon.com/512/1800/1800912.png',
        'type': 'Motivator',
        'date': 'Jun 30 - Jul 30, 2023',
      },
      {
        'title':
            'Lorem ipsum dolor sit amet consectetur. GdhEst dolor sit amet consectetur',
        'icon': 'https://cdn-icons-png.flaticon.com/512/1800/1800912.png',
        'type': 'Motivator',
        'date': 'Jun 30 - Jul 30, 2023',
      },
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
                  print('Selected filter index: $index');
                },
              ),
            ),

            // Challenge cards - Vertical ListView
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: challenges.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 200, // Set a fixed height or adjust as needed
                  child: ChallengeCard(
                    item: challenges[index],
                    // Add your custom leftBorderColor if needed
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
