import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/models/match_model.dart';

class MatchCard extends StatelessWidget {
  final Match matchDetails;

  const MatchCard({Key? key, required this.matchDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 96,
          padding: const EdgeInsets.all(16),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Team 1
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: ShapeDecoration(
                          color: Color(int.parse(
                              "0xff${matchDetails.teamSet[0].accentColor}")),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
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
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 131,
                        child: Text(
                          matchDetails.teamSet[0].teamName,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 31,
                        child: Text(
                          '01',
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: ShapeDecoration(
                          color: Color(int.parse(
                              "0xff${matchDetails.teamSet[1].accentColor}")),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
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
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 134,
                        child: Text(
                          matchDetails.teamSet[1].teamName,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 31,
                        child: Text(
                          '02',
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Divider
              Opacity(
                opacity: 0.80,
                child: Container(
                  width: 1,
                  height: 64,
                  decoration: const BoxDecoration(color: Color(0xFFD0D1DA)),
                ),
              ),
              const SizedBox(width: 16),
              // Date
              SizedBox(
                width: 80,
                child: Text(
                  '26 Jul 2023',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
