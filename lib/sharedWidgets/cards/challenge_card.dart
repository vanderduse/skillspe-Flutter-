import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:skills_pe/screens/bidding/bidding_stepone_screen.dart';
import 'package:skills_pe/screens/tournaments/widgets/create_team_bottom_sheet.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/buttons/unfilled_btn.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';
import 'package:skills_pe/utility/text_utility.dart';
import 'package:skills_pe/utility/utility.dart';

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
    final DateTime startDate =
        DateFormat("yyyy-MM-dd").parse(item?.startTime ?? "");
    final String formattedEndDate = DateFormat("MMM dd, yyyy")
        .format(DateFormat("yyyy-MM-dd").parse(item?.endTime ?? ""));
    ;
    final String formattedStartDate =
        '${DateFormat.MMM().format(startDate)} ${DateFormat("d").format(startDate)}';

    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 0.9 * deviceWidth,
      margin: EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 8, bottom: 16, left: 8, right: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 10, // Blur radius
              offset: const Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.all(16), // Occupy complete available width
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF8C50F6), // #8C50F6
                  Color(0xFF141941), // #141941
                ],
                stops: [0.0, 1.0],
                transform: GradientRotation(
                    107.04 * 3.14 / 180), // Convert degrees to radians
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(8),
                            height: 46,
                            width: 46,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Text(
                              item?.challengeEmoji ?? "",
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/person_check.svg",
                          height: 18,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Owner",
                          style: TextStyle(
                              color: HexColor("#a99acf"),
                              fontFamily: "Inter",
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Half Marathon Virtual Running Challenge ",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                            color: Color(0xFFFFFFFF)
                                .withOpacity(0.5), // Color #FFFFFF80
                            width: 0.5,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                                color: HexColor("#FD1010"),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          SizedBox(width: 6),
                          Text(
                            TextUtility.toSentenceCase(item?.status ?? ""),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                            color: Color(0xFFFFFFFF)
                                .withOpacity(0.5), // Color #FFFFFF80
                            width: 0.5,
                          )),
                      child: Text(
                        '${TextUtility.toSentenceCase(formattedStartDate)} - ${TextUtility.toSentenceCase(formattedEndDate)}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(8),
                        height: 46,
                        width: 46,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text(
                          item?.challengeEmoji ?? "",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'View',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),

          // Container(
          //     width: double.infinity,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           child: FilledBtn(
          //               label: "View",
          //               onPressed: () {},
          //               backgroundColor: Theme.of(context).primaryColor,
          //               textColor: Colors.white),
          //         )
          //       ],
          //     ))
        ],
      ),
    );
  }
}
