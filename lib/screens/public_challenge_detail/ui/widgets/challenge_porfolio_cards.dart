import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/challenge_portfolio_detail_response.dart';
import 'package:skills_pe/utility/constants.dart';

class ChallengePortfolioCard extends StatelessWidget {
  final ChallengePortfolioDetailResponse _portfolioDetail;

  const ChallengePortfolioCard(this._portfolioDetail, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      margin: const EdgeInsets.fromLTRB(0, 20, 30, 20),
      color: Colors.white,
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
                  "assets/icons/invested_money.svg",
                  height: 40,
                  width: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Total \nInvested",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.3),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "$RUPEE${_portfolioDetail.investedAmount}",
              style: TextStyle(
                  fontFamily: "Inter",
                  color: Theme.of(context).primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            const Text(
              "June 30 - Today",
              style: TextStyle(
                  fontFamily: "Inter",
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}
