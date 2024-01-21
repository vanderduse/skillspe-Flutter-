import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TeamNameWithIcon extends StatelessWidget {
  String teamName;
  String iconColor;

  TeamNameWithIcon(
      {super.key, required this.teamName, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: ShapeDecoration(
            color: Color(int.parse(iconColor)),
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
        Text(
          teamName,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
