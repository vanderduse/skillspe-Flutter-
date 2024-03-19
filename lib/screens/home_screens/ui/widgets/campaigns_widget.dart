import 'package:flutter/material.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';
import 'package:skills_pe/sharedWidgets/cards/campaigns_card.dart';
import 'package:skills_pe/screens/view_all/ui/challenges_list_screen.dart';

class CampaignsWidget extends StatelessWidget {
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

  CampaignsWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15.0),
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
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
                child: CampaignsCard(
                  item: data[index],
                  leftBorderColor: leftBorderColor,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
