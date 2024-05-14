import 'package:flutter/material.dart';

class BidingHistoryTag extends StatelessWidget {
  const BidingHistoryTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.green, // Border color
          width: 1, // Border width
        ),
      ),
      child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text(
            'Matched',
            style: TextStyle(
                color: Colors.green,
                fontSize: 10,
                height: 1.3,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
