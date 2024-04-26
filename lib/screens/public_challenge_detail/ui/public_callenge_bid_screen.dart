import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/bid_percentage_bar.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/public_challenge_description.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/bid_options.dart';

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
            const EdgeInsets.all(20), // Adding margin to the parent container
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title at the top aligned to the left
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do?',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            BidPercentageBar(
              firstPartPercentage: 30,
              secondPartPercentage: 70,
            ),
            SizedBox(height: 20),
            PublicChallengeDescription(
              challengeStatus: 'Live',
              challengeDate: 'Jun 30 - July 30',
              source: 'Binance Stats API',
              totalTraders: '1180',
            ),
            SizedBox(height: 20),
            BidOptions(),
          ],
        ),
      ),
    );
  }
}
