import 'package:flutter/material.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';
import 'package:skills_pe/sharedWidgets/cards/public_challenge_card.dart';
import 'package:skills_pe/screens/view_all/ui/challenges_list_screen.dart';

class PublicChallengesWidget extends StatelessWidget {
  final String title;
  final List<ChallengesListResponse> data;

  final List<String> leftBorderColors = [
    '#ED5E91',
    '#5241AC',
    '#DA5EED',
    '#ffc800',
    '#00b6bd',
    '#0dbd00',
    '#9d00bd',
  ];

  PublicChallengesWidget({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to ViewAllChallenges screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChallengesListScreen(),
                    ),
                  );
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xFF8C50F6), // Customize text color
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 260, // Set a fixed height for the horizontal ListView
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                // Use modulo to loop through the colors
                String leftBorderColor =
                    leftBorderColors[index % leftBorderColors.length];
                return Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% of screen width
                  margin: EdgeInsets.symmetric(
                    horizontal: index == 0
                        ? 16.0
                        : (index == data.length - 1 ? 16.0 : 10.0),
                  ),
                  child: PublicChallengeCard(
                    item: data[index],
                    leftBorderColor: leftBorderColor,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
