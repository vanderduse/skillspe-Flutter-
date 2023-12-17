import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoTeamContainer extends StatelessWidget {
  const NoTeamContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(160), color: Colors.white),
            child: Center(
              child: SvgPicture.asset(
                "assets/illustrations/t-shirt.svg",
                height: 56,
                width: 56,
              ),
            )),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Add teams to the tournament',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
