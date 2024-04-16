import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/screens/challenge_detail/ui/challenge_info_screen.dart';
import 'package:skills_pe/screens/challenge_detail/ui/challenge_detail_tab.dart';

class ChallengeDetailScreen extends StatefulWidget {
  final String? challengeId;
  final String? challengeName;
  const ChallengeDetailScreen(
      {super.key, required this.challengeId, required this.challengeName});

  @override
  State<StatefulWidget> createState() => _ChallengeDetailState();
}

class _ChallengeDetailState extends State<ChallengeDetailScreen>
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

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.animation!.removeListener(_handleTabScroll);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.challengeName!),
          automaticallyImplyLeading: true,
          shadowColor: Colors.black,
          bottom: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                    child: SvgPicture.asset(_selectedTabIndex == 0
                        ? "assets/icons/info-circle-selected.svg"
                        : "assets/icons/info-circle.svg")),
                Tab(
                    child: SvgPicture.asset(_selectedTabIndex == 1
                        ? "assets/icons/chart-selected.svg"
                        : "assets/icons/chart.svg")),
                Tab(
                    child: SvgPicture.asset(_selectedTabIndex == 2
                        ? "assets/icons/setting-selected.svg"
                        : "assets/icons/setting.svg")),
              ]),
        ),
        body: TabBarView(controller: _tabController, children: [
          ChallengeInfoScreen(challengeId: widget.challengeId),
          ChallengeDetailTab(challengeId: widget.challengeId),
          ChallengeDetailTab(challengeId: widget.challengeId)
        ]),
      ),
    );
  }
}
