import 'package:flutter/material.dart';

class BidPercentageBar extends StatelessWidget {
  final double firstPartPercentage;
  final double secondPartPercentage;

  const BidPercentageBar({
    Key? key,
    required this.firstPartPercentage,
    required this.secondPartPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: firstPartPercentage.toInt(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF34C1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    '${firstPartPercentage.toInt()}%',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: secondPartPercentage.toInt(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF8247DF),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    '${secondPartPercentage.toInt()}%',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
