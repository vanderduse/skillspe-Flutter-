import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff2e1452),
              image: DecorationImage(
                image: AssetImage('assets/splash_screen_2.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Image.asset('assets/logo.png', fit: BoxFit.fill),
          ),
          const Center(
            child: AutoSizeText(
              'Skillspe',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
