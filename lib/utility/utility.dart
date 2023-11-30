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
