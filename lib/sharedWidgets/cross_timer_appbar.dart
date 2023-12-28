import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/sharedWidgets/timer.dart';

AppBar navigationWithTimer(
    BuildContext context, screenName, double? walletAmount) {
  return AppBar(
    centerTitle: false,
    automaticallyImplyLeading: false,
    shape: const Border(
        bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.10), width: 1)),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/close.svg",
              height: 20,
              width: 20,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
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
    actions: walletAmount != null
        ? [TimerWidget(totalTimeInSeconds: walletAmount)]
        : null,
  );
}
