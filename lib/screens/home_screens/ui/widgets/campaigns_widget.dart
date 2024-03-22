import 'package:flutter/material.dart';
import 'package:skills_pe/screens/view_all/ui/campaign_list_screen.dart';
import 'package:skills_pe/sharedWidgets/cards/campaigns_card.dart';
import '../../model/list_campaign_response.dart';

class CampaignsWidget extends StatelessWidget {
  final List<CampaignListResponse> data;

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
          height: 370,
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < data.length) {
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
                } else {
                  return Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CampaignListScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'View All -> ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8C50F6),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
