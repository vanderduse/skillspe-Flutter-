import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skills_pe/screens/home_screens/ui/main.dart';
import 'package:skills_pe/screens/login_screens/main.dart';
import 'package:skills_pe/screens/splash_screen/splash_screen_1.dart';
import 'package:skills_pe/service/storage_service.dart';
import 'package:skills_pe/utility/constants.dart';

class SplashManager extends StatefulWidget {
  const SplashManager({super.key});

  @override
  State<SplashManager> createState() => _SplashManagerState();
}

class _SplashManagerState extends State<SplashManager> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkAccessToken(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashScreen1());
  }

  Future<void> checkAccessToken(BuildContext context) async {
    String? accessToken = await StorageService().readSecureData(ACCESS_TOKEN);

    if (accessToken != null && accessToken.isNotEmpty) {
      // AccessToken found, navigate to home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeMain()),
      );
    } else {
      // AccessToken not found, navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeMain()),
      );
    }
  }
}
