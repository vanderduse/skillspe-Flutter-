import 'package:flutter/material.dart';

AppBar appWithTitleAndCancel(String screenName, VoidCallback onCancel) {
  return AppBar(
    centerTitle: false,
    automaticallyImplyLeading: false,
    shape: const Border(
        bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.10), width: 1)),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
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
    actions: [
      Container(
        padding: const EdgeInsets.only(right: 20),
        child: TextButton(
          onPressed: onCancel,
          style: TextButton.styleFrom(foregroundColor: const Color(0xff7E56DA)),
          child: const Text("Cancel"),
        ),
      )
    ],
  );
}
