import 'package:flutter/material.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';
import 'package:skills_pe/sharedWidgets/cards/challenge_card.dart';
import 'package:skills_pe/screens/view_all/ui/challenges_list_screen.dart';

class ChallengesWidget extends StatelessWidget {
  final String title;
  final String subTitle;
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

  ChallengesWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 8.0, top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E1452),
                    ),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFF5C6068),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChallengesListScreen(),
                    ),
                  );
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8C50F6),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15.0),
          child: SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                // Use modulo to loop through the colors
                String leftBorderColor =
                    leftBorderColors[index % leftBorderColors.length];
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.symmetric(
                    horizontal: index == 0
                        ? 16.0
                        : (index == data.length - 1 ? 16.0 : 10.0),
                  ),
                  // margin: EdgeInsets.fromLTRB(index == 0 ? 30.0 : 10, 0,
                  //     index == data.length - 1 ? 30.0 : 10.0, 0),
                  child: ChallengeCard(
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
