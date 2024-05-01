import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/challenge_detail/ui/challenge_detail_screen.dart';
import 'package:skills_pe/screens/create_challenge/ui/create_challenge_screen.dart';
import 'package:skills_pe/screens/home_screens/model/list_private_challenges_response.dart';
import 'package:skills_pe/screens/home_screens/ui/widgets/challenge_card_factory.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/utility/text_utility.dart';
import 'package:skills_pe/utility/utility.dart';

class DraftChallengeCard extends ChallengeCard {
  final dynamic leftBorderColor;
  const DraftChallengeCard(
      {Key? key,
      required PrivateChallengesListResponse item,
      this.leftBorderColor = '#ED5E91'})
      : super(key: key, item: item);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 0.92 * deviceWidth,
      margin: const EdgeInsets.only(bottom: 20),
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
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.all(16), // Occupy complete available width
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: HexColor("#F4F4F4"),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              item.challengeEmoji ?? "",
                              style: const TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/person_check.svg",
                            height: 18,
                            colorFilter: ColorFilter.mode(
                                HexColor("#646464"), BlendMode.srcIn)),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          TextUtility.toSentenceCase(
                              item.participationDetails?.type ?? ""),
                          style: TextStyle(
                              color: HexColor("#646464"),
                              fontFamily: "Inter",
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  item.title ?? "",
                  style: TextStyle(
                      color: HexColor("#0A121A"),
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                            color: HexColor("#C8C8C8"), // Color #FFFFFF80
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
                                color: HexColor("#96F023"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            TextUtility.toSentenceCase(item.status ?? ""),
                            style: TextStyle(
                                color: HexColor("#646464"),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                            color: HexColor("#C8C8C8"), // Color #FFFFFF80
                            width: 0.5,
                          )),
                      child: Text(
                        '${convertServerDateToMMMdd(item.startTime)} - ${convertServerDate(item.endTime, MMM_DD_YYYY_FORMAT)}',
                        style: TextStyle(
                            color: HexColor("#646464"),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 38,
                  height: 38,
                  child: OutlinedButton(
                    onPressed: () {
                      // Button action
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFFFF34C1), // Outline color
                          width: 1, // Outline width
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          item.participationFee = 100.00;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateChallengeScreen(
                                isEdit: true,
                                challengeDetail: item,
                              ),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/icons/edit.svg",
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                    height: 40.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChallengeDetailScreen(
                              challengeId: item.id,
                              challengeName: item.title,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'View',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircularImage extends StatelessWidget {
  final double height;
  final String imageUrl;

  const CircularImage({
    Key? key,
    required this.height,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: SizedBox(
          width:
              height, // Circular image size (height acts as width for a perfect circle)
          height: height, // Circular image size
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover, // Cover the circular space
          ),
        ),
      ),
    );
  }
}
