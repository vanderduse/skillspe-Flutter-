import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/public_challenge_portfolio_screen.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_text_btn_appbar.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/public_challenge_bid_screen.dart';

class PublicChallengeInfoScreen extends StatefulWidget {
  const PublicChallengeInfoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PublicChallengeInfoScreenState();
}

class _PublicChallengeInfoScreenState extends State<PublicChallengeInfoScreen> {
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
        },
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
            color: const Color.fromARGB(255, 247, 241, 241),
            child: Column(
              children: [
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.white, // Background color of the tab bar
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      child: TabBar(
                        onTap: (index) {
                          setState(() {
                            _isTab1Selected = index == 0;
                          });
                        },
                        indicatorSize: TabBarIndicatorSize.label,
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
                    )),
                Expanded(
                    child: TabBarView(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 247, 241, 241),
                      child: const PublicChallengeBidScreen(),
                    ),
                    Container(
                      color: const Color.fromARGB(255, 247, 241, 241),
                      child: ChallengePortfolioScreen(),
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
