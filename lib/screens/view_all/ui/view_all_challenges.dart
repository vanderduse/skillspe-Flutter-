import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/filter_buttons.dart';
import 'package:skills_pe/screens/home_screens/ui/quiz_widget.dart';

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
    // Dummy data for the quiz cards - Replace this with your actual data
    List<Map<String, dynamic>> quizData = [
      {'title': 'Quiz 1', 'date': '12-01-2023', 'participants': '1000', 'price': '\$10'},
      {'title': 'Quiz 2', 'date': '15-02-2023', 'participants': '1500', 'price': '\$15'},
      // Add more data as needed
    ];

    return Scaffold(
      appBar: navigationWithWallet('Challenges', dummyWalletAmount),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Your app bar
          // navigationWithWallet('Challenges', dummyWalletAmount),

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

          // Quiz cards - Vertical ListView
          Expanded(
            child: ListView.builder(
              itemCount: quizData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0), // Adjust top padding
                  child: QuizWidget(
                    title: 'Quiz ${index + 1}', // Change title as needed
                    data: quizData,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
