import 'package:flutter/material.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';

class ChallengeCard extends StatelessWidget {
  final ChallengesListResponse? item;
  final dynamic leftBorderColor;

  const ChallengeCard(
      {super.key, required this.item, this.leftBorderColor = '#ED5E91'});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final cardWidth = screenWidth * 0.9;
    final leftWidth = cardWidth * 0.02;
    final middleWidth = cardWidth * 0.15;

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 14),
      padding: const EdgeInsets.only(top: 15, bottom: 10, right: 15),
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 10, // Blur radius
            offset: const Offset(0, 5), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: leftWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      // margin: EdgeInsets.only(right: 16.0),
                      height: 60,
                      decoration: BoxDecoration(
                        color: leftBorderColor != null
                            ? Color(int.parse(leftBorderColor.substring(1, 7),
                                    radix: 16) +
                                0xFF000000)
                            : Colors
                                .transparent, // Provide a default color or handle null
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 5.0), // Adjust the value as needed
            child: SizedBox(
              width: middleWidth,
              child: Center(
                child: ClipRect(
                  child: SizedBox(
                    width: 48.0,
                    height: 58.0,
                    child: Text(
                      item?.challengeEmoji ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 32,
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
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item?.title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            item?.category ?? "",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // First container displaying text
                        Container(
                          width: 140,
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            formatChallengeDate(item?.startTime, item?.endTime),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),

                          // Second container for the button
                          UnFilledBtn(
                              label: BID,
                              onPressed: () {
                                BottomSheetManager.showGenericBottomSheet(
                                    context,
                                    const BiddingStepOneScreen(),
                                    "Bidding");
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
