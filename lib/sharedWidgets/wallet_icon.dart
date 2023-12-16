import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletIcon extends StatelessWidget {
  final double walletAmount;

  const WalletIcon({
    Key? key,
    required this.walletAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: const Color(0xffFDF0CE),
            borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          children: [
            Container(
              child: SvgPicture.asset(
                "assets/icons/wallet.svg",
                height: 20,
                width: 20,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: Text(
                walletAmount.toStringAsFixed(1),
                style: const TextStyle(
                    color: Color(0xff181201), fontWeight: FontWeight.w500),
              ),
            )
          ],
        ));
  }
}
