import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/bidding_history_animated_view.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/challenge_porfolio_cards.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/challenge_status.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/utility.dart';

class ChallengePortfolioScreen extends StatelessWidget {
  const ChallengePortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            Positioned(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                maxLines: 2,
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do?',
                                style: TextStyle(
                                    color: HexColor("#1A2022"),
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    height: 1.3),
                              ))),
                      ChallengeStatus(),
                    ],
                  ),
                ),
                Center(
                  child: Row(
                    children: [
                      Expanded(
                          child: Card(
                        margin: const EdgeInsets.fromLTRB(30, 20, 0, 20),
                        color: Theme.of(context).primaryColor,
                        elevation: 1,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/send_money.svg",
                                    height: 40,
                                    width: 25,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Total \nReturns",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.white,
                                          height: 1.3),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "${RUPEE}2000.34",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "June 30 - Today",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      )),
                      ChallengePortfolioCard()
                    ],
                  ),
                ),
              ],
            )),
            BiddingHistoryAnimatedView(constraints),
          ],
        ),
      );
    });
  }
}
