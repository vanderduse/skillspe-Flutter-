import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar navigationWithTextButton(
  BuildContext context,
  String screenName, {
  bool share = false,
  VoidCallback? onSharePress,
  String? buttonText,
  VoidCallback? onPressedText,
}) {
  List<Widget> actions = [
    if (share && onSharePress != null)
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: IconButton(
          icon: const Icon(Icons.share),
          onPressed: onSharePress,
          iconSize: 20,
        ),
      ),
    if (buttonText != null && onPressedText != null)
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: TextButton(
          onPressed: onPressedText,
          child: Text(buttonText),
        ),
      ),
  ];

  return AppBar(
    centerTitle: false,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/arrow-left.svg",
              height: 20,
              width: 20,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
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
    actions: actions,
  );
}
