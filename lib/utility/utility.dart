import 'package:flutter/material.dart';

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}

showSnackBar(BuildContext context, String message) {
  var snackBar = SnackBar(
      content: Text(
    message,
  ));
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class HexColor extends Color {
  static int _getColorFromHex(String? hexColor) {
    try {
      hexColor = hexColor?.toUpperCase().replaceAll("#", "");
      if (hexColor?.length == 6) {
        hexColor = "FF$hexColor";
      }
      return int.parse(hexColor!, radix: 16);
    } catch (e) {
      return 0;
    }
  }

  HexColor(final String? hexColor) : super(_getColorFromHex(hexColor));
}
