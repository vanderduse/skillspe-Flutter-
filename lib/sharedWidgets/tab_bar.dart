import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabIcons;
  final List<String> tabTitles;
  final List<Widget> tabScreens;

  const CustomTabBar({
    Key? key,
    required this.tabIcons,
    required this.tabTitles,
    required this.tabScreens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabIcons.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(tabTitles[0]), // Set initial title
          bottom: TabBar(
            tabs: tabIcons.map((icon) => Tab(child: icon)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabScreens,
        ),
      ),
    );
  }
}
