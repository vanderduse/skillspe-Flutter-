import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/home_screens/model/list_private_challenges_response.dart';
import 'package:skills_pe/screens/home_screens/ui/widgets/challenge_card_factory.dart';
import 'package:skills_pe/utility/text_utility.dart';
import 'package:skills_pe/utility/utility.dart';

class ResultPendingChallengeCard extends ChallengeCard {
  final dynamic leftBorderColor;
  const ResultPendingChallengeCard(
      {Key? key,
      required PrivateChallengesListResponse item,
      this.leftBorderColor = '#ED5E91'})
      : super(key: key, item: item);

  @override
  Widget build(BuildContext context) {
    final participantsLength =
        item.options!.length <= 4 ? item.options!.length : 4;
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
                        SvgPicture.asset(
                          "assets/icons/person_check.svg",
                          height: 18,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          TextUtility.toSentenceCase(
                              item.participationDetails?.type ?? ""),
                          style: TextStyle(
                              color: HexColor("#a99acf"),
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
                  style: const TextStyle(
                      color: Colors.white,
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
                            color: const Color(0xFFFFFFFF)
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
                                color: HexColor("#F87B20"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            TextUtility.toSentenceCase(item.status ?? ""),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: HexColor("#F0F0F0"),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(300))),
                  child: item.options?.isNotEmpty == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0; i < participantsLength; i++)
                              Align(
                                widthFactor: 0.8,
                                child: CircularImage(
                                  height: 24,
                                  imageUrl:
                                      item.options![i].profileImgUrl ?? "",
                                ),
                              ),
                            const SizedBox(
                              width: 4,
                            ),
                            participantsLength > 4
                                ? Text(
                                    "+${item.options!.length - participantsLength}")
                                : const Text("")
                          ],
                        )
                      : null,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor("#CBCBCB"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Results',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
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
