import 'package:flutter/material.dart';

class BidingHistoryTag extends StatelessWidget {
  final String tag;
  final Color color;
  const BidingHistoryTag({super.key, required this.tag, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: color, // Border color
          width: 1, // Border width
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text(
            tag,
            style: TextStyle(
                color: color,
                fontSize: 10,
                height: 1.3,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
