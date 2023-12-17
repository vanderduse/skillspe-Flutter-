import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/tournaments/models/TeamModel.dart';

class TeamCard extends StatelessWidget {
  final Team teamDetails;

  const TeamCard({Key? key, required this.teamDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: const [
              BoxShadow(
                color: Color(0x19717C86),
                blurRadius: 8,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(
                    color: Color(int.parse("0xff${teamDetails.accentColor}")),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19717C86),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/t-shirt-white.svg",
                    ),
                  )),
              const SizedBox(width: 16),
              Opacity(
                opacity: 0.80,
                child: Container(
                  width: 1,
                  height: 48,
                  decoration: const BoxDecoration(color: Color(0xFFD0D1DA)),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 221,
                    child: Text(
                      teamDetails.teamName,
                      style: const TextStyle(
                        color: Color(0xFF0A121A),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(teamDetails.captainProfile),
                              fit: BoxFit.fill,
                            ),
                            shape: const OvalBorder(
                              side: BorderSide(width: 1, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          teamDetails.captainName,
                          style: const TextStyle(
                            color: Color(0xFF5C6068),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              SvgPicture.asset(
                "assets/icons/arrow-right.svg",
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
