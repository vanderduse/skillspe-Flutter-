import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/sharedWidgets/wallet_icon.dart';

AppBar navigationWithWallet(
  String screenName,
  double walletAmount, {
  bool showBack = true,
}) {
  return AppBar(
    centerTitle: false,
    automaticallyImplyLeading: false,
    shape: const Border(
      bottom: BorderSide(
        color: Color.fromRGBO(0, 0, 0, 0.10),
        width: 1,
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Conditionally show back icon based on showBack value
        if (showBack)
          Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/arrow-left.svg",
              height: 20,
              width: 20,
            ),
          ),
        // Conditionally show home icon if screenName is "Home"
        if (screenName == "Home")
          Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/skillspe_logo.svg",
              height: 25,
              // width: 20,
            ),
          ),
        // Conditionally show home icon if screenName is not "Home"
        if (screenName != "Home")
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              screenName,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
      ],
    ),
    actions: [
      WalletIcon(walletAmount: walletAmount),
      SvgPicture.asset(
        "assets/icons/notification.svg",
        height: 26,
        width: 26,
      ),
      Container(
        margin: const EdgeInsets.only(right: 20),
      ),
    ],
  );
}
