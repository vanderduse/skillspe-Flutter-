import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/screens/tournaments/create_tournament.dart';
import 'package:skills_pe/screens/profile/ui/main.dart';
import 'package:skills_pe/screens/home_screens/ui/main.dart';
import 'package:skills_pe/utility/constants.dart';
import '../../../create_challenge/ui/create_challenge_screen.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final String activeTab;

  const BottomNavigationBarWidget({Key? key, required this.activeTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 55,
      child: Container(
        height: double.infinity,
        width: 260,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                if (activeTab != 'home') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeMain(),
                    ),
                  );
                }
              },
              child: SvgPicture.asset(
                activeTab == 'home'
                    ? 'assets/icons/bottomNavIcons/home_active.svg'
                    : 'assets/icons/bottomNavIcons/home_inactive.svg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
              child: SpeedDial(
                overlayColor: Colors.black,
                direction: SpeedDialDirection.up,
                icon: Icons.add,
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                activeIcon: Icons.close,
                visible: true,
                curve: Curves.bounceInOut,
                elevation: 8.0,
                overlayOpacity: 0.8,
                childrenButtonSize: const Size(180, 55),
                spacing: 16,
                children: [
                  SpeedDialChild(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/bottomNavIcons/flag.svg'),
                          const Text(
                            CREATE_TOURNAMENT,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Inter",
                              color: Color.fromRGBO(70, 43, 156, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white,
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateTournament(),
                        ),
                      ),
                    },
                  ),
                  SpeedDialChild(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/bottomNavIcons/cup.svg'),
                          const Text(
                            CREATECHALLENGE,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Inter",
                              color: Color.fromRGBO(70, 43, 156, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white,
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateChallengeScreen(),
                        ),
                      ),
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (activeTab != 'profile') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                }
              },
              child: SvgPicture.asset(
                activeTab == 'profile'
                    ? 'assets/icons/bottomNavIcons/profile_active.svg'
                    : 'assets/icons/bottomNavIcons/profile_inactive.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
