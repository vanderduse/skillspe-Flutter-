import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlertBanner extends StatelessWidget {
  final String alertMessage;

  const AlertBanner({Key? key, required this.alertMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19717C86),
            blurRadius: 8,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/info.svg",
              height: 20,
              width: 20,
            ),
          ),
          Expanded(
            child: Text(
              alertMessage,
              style: const TextStyle(
                color: Color(0xFF0A121A),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
