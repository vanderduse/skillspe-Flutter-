import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_text_btn_appbar.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/public_callenge_bid_screen.dart';

class PrivateChallengeInfoScreen extends StatefulWidget {
  const PrivateChallengeInfoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrivateChallengeInfoScreenState();
}

class _PrivateChallengeInfoScreenState
    extends State<PrivateChallengeInfoScreen> {
  bool _isTab1Selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationWithTextButton(
        context,
        'Challenge Name',
        share: true, // Enable share option
        onSharePress: () {
          // Share icon press callback
          print('Share icon pressed');
        },
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            // title: Container(width: 0, height: 0),
            title: Text('Challenge Name'),
            bottom: TabBar(
              onTap: (index) {
                setState(() {
                  _isTab1Selected = index == 0;
                });
              },
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    _isTab1Selected
                        ? 'assets/icons/info-circle-selected.svg'
                        : 'assets/icons/info-circle-grey.svg',
                    height: 24, // adjust size as needed
                    width: 24,
                  ),
                ),
                Tab(
                  icon: SvgPicture.asset(
                    !_isTab1Selected
                        ? 'assets/icons/bar-chart-active.svg'
                        : 'assets/icons/bar-chart-inactive.svg',
                    height: 24, // adjust size as needed
                    width: 24,
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              PublicChallengeBidScreen(),
              Center(
                child: Text('Screen 2'), // Replace with your screen widget
              ),
            ],
          ),
        ),
      ),
    );
  }
}
