import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/screens/tournaments/create_tournament.dart';
import 'package:skills_pe/utility/constants.dart';
import '../../create_challenge/ui/create_challenge_screen.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        // bottom: 100,
        // left: 80,
        // right: 80,
        height: 50,
        child: Container(
          height: double.infinity,
          width: 220,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                'assets/icons/bottomNavIcons/home.svg',
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 8, top: 4, right: 0, bottom: 4),
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
                    spacing: 3,
                    children: [
                      SpeedDialChild(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/bottomNavIcons/flag.svg'),
                              const Text(CREATE_TOURNAMENT,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Inter",
                                      color: Color.fromRGBO(70, 43, 156, 1)))
                            ],
                          ),
                        ),
                        backgroundColor: Colors.white,
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateTournament()))
                        },
                      ),
                      SpeedDialChild(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/bottomNavIcons/cup.svg'),
                              const Text(CREATECHALLENGE,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Inter",
                                      color: Color.fromRGBO(70, 43, 156, 1)))
                            ],
                          ),
                        ),
                        backgroundColor: Colors.white,
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateChallengeScreen()))
                        },
                      ),
                    ],
                  )),
              SvgPicture.asset('assets/icons/bottomNavIcons/profile_circle.svg')
            ],
          ),
        ));
  }
}
