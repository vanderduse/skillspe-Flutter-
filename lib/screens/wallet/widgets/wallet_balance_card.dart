import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletBalance extends StatelessWidget {
  const WalletBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
          color: const Color(0xFFFDF0CE),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x33181201)),
            borderRadius: BorderRadius.circular(8),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset("assets/icons/wallet.svg"),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "Balance",
                style: TextStyle(
                  color: Color(0xFF181201),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              )
            ],
          ),
          SizedBox(
            child: Opacity(
              opacity: 0.50,
              child: Text(
                '₹ 00',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF181201),
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
