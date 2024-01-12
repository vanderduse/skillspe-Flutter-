import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/home_screens/main.dart';
import 'package:skills_pe/screens/leaderboards/widgets/current_user_badge.dart';
import 'package:skills_pe/screens/leaderboards/widgets/podium.dart';
import 'package:skills_pe/screens/leaderboards/widgets/user_badge.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';
import 'package:skills_pe/utility/constants.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationWithWallet("Quiz Name", 23.56),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: FilledBtn(
            backgroundColor: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () {},
            label: SHARE,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 24, bottom: 50),
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Leaderboard',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0A121A),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Updated on 23 Mar 2023',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF5C6068),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [
                            Color(0xFF2E1452),
                            Color(0xFF86299B),
                            Color(0xFF763EAD),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              "assets/illustrations/doodles.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                height: 18,
                                child:
                                    SvgPicture.asset("assets/white-logo.svg"),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Podium()),
                                    ...[5, 8]
                                        .map(
                                          (e) => Column(
                                            children: [
                                              UserBadge(
                                                imageUrl:
                                                    "https://via.placeholder.com/32x32",
                                                name: "Ahmad Rosser",
                                                score: 97,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                        )
                                        .toList(),
                                    CurrentUserBadge()
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
