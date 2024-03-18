import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/utility/constants.dart';

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
            SvgPicture.asset(
              "assets/icons/wallet.svg",
              height: 20,
              width: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: Row(
                children: [
                  Text(
                    RUPEE_SYMBOL,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    walletAmount.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
