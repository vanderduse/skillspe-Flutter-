import 'package:flutter/material.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/confirm_bid_bottom_sheet.dart';
import 'package:skills_pe/sharedWidgets/bid_percentage_bar.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/public_challenge_description.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/bid_options.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';

class PublicChallengeBidScreen extends StatefulWidget {
  const PublicChallengeBidScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrivateChallengeInfoScreenState();
}

class _PrivateChallengeInfoScreenState extends State<PublicChallengeBidScreen> {
  String challengeStatus = 'Live';
  bool isYesSelected = true;
  String? _activeCard = 'Yes';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin:
            const EdgeInsets.all(30), // Adding margin to the parent container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title at the top aligned to the left
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do?',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const BidPercentageBar(
              firstPartPercentage: 30,
              secondPartPercentage: 70,
            ),
            const SizedBox(height: 20),
            const PublicChallengeDescription(
              challengeStatus: 'Live',
              challengeDate: 'Jun 30 - July 30',
              source: 'Binance Stats API',
              totalTraders: '1180',
            ),
            const SizedBox(height: 20),
            const BidOptions(),
            const SizedBox(height: 10),
            FilledBtn(
                label: "Confim your bid ->",
                onPressed: () {
                  _confirmBidBottomSheet(context, "", "");
                },
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white)
          ],
        ),
      ),
    );
  }

  void _confirmBidBottomSheet(
      BuildContext parentContext, String userType, String challengeId) {
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ConfirmBidBottomSheet(
          parentContext: context,
        );
      },
    );
  }
}
