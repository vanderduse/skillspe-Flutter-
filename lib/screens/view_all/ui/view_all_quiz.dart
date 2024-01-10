import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/filter_buttons.dart';
import 'package:skills_pe/sharedWidgets/quiz_card.dart';

class ViewAllQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy wallet amount for demonstration
    double dummyWalletAmount = 100.0;
    // Filter button names
    List<String> filterButtonNames = ['All', 'Live', 'Upcoming'];

    // Dummy list of challenge data for demonstration
    List<Map<String, dynamic>> quiz = [
      {
        'title':
            'Lorem ipsum dolor sit amet consectetur. GdhEst dolor sit amet consectetur',
        'icon': 'https://cdn-icons-png.flaticon.com/512/4999/4999578.png',
        'participants': '100+ participants',
        'date': 'Starts on 01 Oct 23',
        'price': '₹50'
      },
      {
        'title':
            'Lorem ipsum dolor sit amet consectetur. GdhEst dolor sit amet consectetur',
        'icon': 'https://cdn-icons-png.flaticon.com/512/4999/4999578.png',
        'participants': '100+ participants',
        'date': 'Starts on 01 Oct 23',
        'price': '₹50'
      },
      {
        'title':
            'Lorem ipsum dolor sit amet consectetur. GdhEst dolor sit amet consectetur',
        'icon': 'https://cdn-icons-png.flaticon.com/512/4999/4999578.png',
        'participants': '100+ participants',
        'date': 'Starts on 01 Oct 23',
        'price': '₹50'
      },
    ];

    return Scaffold(
      appBar: navigationWithWallet('Quiz', dummyWalletAmount),
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
              itemCount: quiz.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 250, // Set a fixed height or adjust as needed
                  child: QuizCard(
                    item: quiz[index],
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
