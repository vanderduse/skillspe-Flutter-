import 'package:flutter/material.dart';
import 'package:skills_pe/screens/bidding/bidding_stepone_screen.dart';
import 'package:skills_pe/screens/tournaments/widgets/create_team_bottom_sheet.dart';
import 'package:skills_pe/sharedWidgets/unfilled_btn.dart';
import 'package:skills_pe/utility/constants.dart';

class ChallengeCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final dynamic leftBorderColor;

  const ChallengeCard({required this.item, this.leftBorderColor = '#ED5E91'});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final cardWidth = screenWidth * 0.9;
    final leftWidth = cardWidth * 0.02;
    final middleWidth = cardWidth * 0.15;

    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 14),
      padding: EdgeInsets.only(top: 15, bottom: 10, right: 15),
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 10, // Blur radius
            offset: Offset(0, 5), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: leftWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    child: Center(
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xFFED5E91),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: middleWidth,
            child: Center(
              child: ClipRect(
                child: SizedBox(
                  width: 28.0,
                  height: 28.0,
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/3176/3176382.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow[100], // Change this to your desired color
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 50.0),
                            child: Container(
                              child: Text(
                                item["title"],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                                8, // Adding some space between title and tag
                          ),

// Container for the tag with fixed width
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: SizedBox(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right:
                                        140.0), // Use const for unchanged EdgeInsets
                                decoration: BoxDecoration(
                                  color: const Color(
                                      0xFFF5F5F5), // Use const for unchanged color
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical:
                                            2), // Use const for unchanged EdgeInsets
                                    child: Text(
                                      item['type'],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors
                          .white, // Setting bottom section background color to white

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // First container displaying text
                          Container(
                            width: 140,
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              item['date'],
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),

                          // Second container for the button
                          UnFilledBtn(
                              label: BID,
                              onPressed: () {
                                print("bidding");
                                BottomSheetManager.showGenericBottomSheet(
                                    context, BiddingStepOneScreen(), "Bidding");
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
