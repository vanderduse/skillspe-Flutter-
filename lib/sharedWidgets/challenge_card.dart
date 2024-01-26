import 'package:flutter/material.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';

class ChallengeCard extends StatelessWidget {
  final ChallengesListResponse item;
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
                        decoration: BoxDecoration(
                          color: leftBorderColor != null
                              ? Color(int.parse(leftBorderColor.substring(1, 7),
                                      radix: 16) +
                                  0xFF000000)
                              : Colors
                                  .transparent, // Provide a default color or handle null
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
                  width: 48.0,
                  height: 58.0,
                  child: Container(
                    child: Text(
                      item.challengeEmoji!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                  // child: Image.network(
                  //   "https://cdn-icons-png.flaticon.com/512/3176/3176382.png",
                  //   fit: BoxFit.cover,
                  // ),
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
                                item.title!,
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
                                margin: const EdgeInsets.only(right: 120.0),
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
                                      item.category!,
                                      style: TextStyle(
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
                            padding: EdgeInsets.all(8),
                            child: Text(
                              formatChallengeDate(
                                  item.startTime, item.endTime),
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),

                          // Second container for the button
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1.1,
                                  color: Color(0xFF8C50F6)), // Border color
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 22, vertical: 10),
                            child: Text(
                              'Bid',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFF8C50F6), // Text color
                              ),
                            ),
                          ),
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
