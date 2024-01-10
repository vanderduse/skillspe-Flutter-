import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/filter_buttons.dart';

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

    return Scaffold(
      appBar: navigationWithWallet('Challenges', dummyWalletAmount),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Your app bar
          // navigationWithWallet('Challenges', dummyWalletAmount),

          // Filter buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonGroup(
              buttonNames: filterButtonNames,
              onItemSelected: (index) {
                // Handle filter button selection here
                print('Selected filter index: $index');
              },
            ),
          ),

          // Other content can go here
          Expanded(
            child: Center(
              child: Text(
                'Your Challenges Content Goes Here',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
