import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationWithWallet("Quiz", 2000.00),
      body: const Column(
        children: [
          AlertBanner(alertMessage: "Quiz related upadtes will come here")
        ],
      ),
    );
  }
}

AppBar navigationWithWallet(String screenName, double walletAmount) {
  return AppBar(
    centerTitle: false,
    automaticallyImplyLeading: false,
    shape: const Border(
        bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.10), width: 1)),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 16),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/icons/arrow-left.svg",
            height: 20,
            width: 20,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft, // Adjust the alignment as needed
          child: Text(
            screenName,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    ),
    actions: [WalletIcon(walletAmount: walletAmount)],
  );
}

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
        child: Container(
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
          ),
        ));
  }
}

class AlertBanner extends StatelessWidget {
  final String alertMessage;

  const AlertBanner({Key? key, required this.alertMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
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
