import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skills_pe/screens/home_screens/main.dart';
import 'package:skills_pe/screens/login_screens/main.dart';
import 'package:skills_pe/screens/splash_screen/splash_screen_1.dart';
import 'package:skills_pe/screens/splash_screen/splash_screen_2.dart';
import 'package:skills_pe/screens/splash_screen/splash_screen_3.dart';
import 'package:skills_pe/screens/splash_screen/splash_screen_4.dart';
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
      // Navigate to the home screen after 3 seconds
      var access = StorageService().readSecureData(ACCESS_TOKEN);
      print('access $access');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return Builder(
            builder: (BuildContext context) {
              return FutureBuilder<Widget>(
                future: getRoute(),
                builder:
                    (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                  return snapshot.data!;
                },
              );
            },
          );
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashScreen1());
  }

  Future<Widget> getRoute() async {
    String? accessToken = await StorageService().readSecureData(ACCESS_TOKEN);
    if (accessToken == null || accessToken.isEmpty) {
      return const LoginScreen();
    } else {
      return const HomeMain();
    }
  }
}
