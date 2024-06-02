import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/home_screens/model/list_public_challenges_response.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/public_challenge_portfolio_screen.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_text_btn_appbar.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/public_challenge_bid_screen.dart';
import 'package:skills_pe/utility/constants.dart';

class PublicChallengeInfoScreen extends StatefulWidget {
  final PublicChallengesItemResponse? item;
  const PublicChallengeInfoScreen({Key? key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PublicChallengeInfoScreenState();
}

class _PublicChallengeInfoScreenState extends State<PublicChallengeInfoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _tabController.animation?.addListener(_handleTabScroll);
  }

  void _handleTabSelection() {
    setState(() {
      _selectedTabIndex = _tabController.index;
    });
  }

  void _handleTabScroll() {
    setState(() {
      _selectedTabIndex = _tabController.index;
    });
  }

  void _bidMorePressed() {
    _tabController.animateTo(0);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.animation!.removeListener(_handleTabScroll);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationWithTextButton(
        context,
        widget.item?.title ?? CHALLENGE_INFO,
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
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(
                            icon: SvgPicture.asset(
                              _selectedTabIndex == 0
                                  ? 'assets/icons/info-circle-selected.svg'
                                  : 'assets/icons/info-circle-grey.svg',
                              height: 24, // adjust size as needed
                              width: 24,
                            ),
                          ),
                          Tab(
                            icon: SvgPicture.asset(
                              _selectedTabIndex == 1
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
                  controller: _tabController,
                  children: [
                    Container(
                      color: const Color.fromRGBO(244, 244, 244, 1),
                      child: PublicChallengeBidScreen(widget.item),
                    ),
                    Container(
                      color: const Color.fromRGBO(244, 244, 244, 1),
                      child: ChallengePortfolioScreen(
                          widget.item!.id!,
                          widget.item?.status,
                          widget.item?.description,
                          _bidMorePressed),
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
