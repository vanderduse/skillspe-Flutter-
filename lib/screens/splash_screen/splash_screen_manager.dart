import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skills_pe/screens/login_screens/main.dart';
import 'package:skills_pe/screens/splash_screen/splash_screen_1.dart';
import 'package:skills_pe/screens/splash_screen/splash_screen_2.dart';
import 'package:skills_pe/screens/splash_screen/splash_screen_3.dart';
import 'package:skills_pe/screens/splash_screen/splash_screen_4.dart';

class SplashManager extends StatefulWidget {
  const SplashManager({super.key});

  @override
  State<SplashManager> createState() => _SplashManagerState();
}

class _SplashManagerState extends State<SplashManager> {
  final PageController _pageController = PageController(initialPage: 0);
  final int numberOfSplashScreens = 4;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();

    // Auto-advance to the next screen every 3 seconds
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentPage < numberOfSplashScreens - 1) {
        currentPage++;
        _pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 1),
          curve: Curves.fastEaseInToSlowEaseOut,
        );
      } else {
        // Navigate to the main content of your app when all splash screens are shown
        timer.cancel(); // Stop the timer
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Login(),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: numberOfSplashScreens,
        itemBuilder: (context, index) {
          return getScreen(index);
        },
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }

  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return const SplashScreen1();
      case 1:
        return const SplashScreen2();
      case 2:
        return const SplashScreen3();
      case 3:
        return const SplashScreen4();
      default:
        return const SplashScreen4();
    }
  }
}
