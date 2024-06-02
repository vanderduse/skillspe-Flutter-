import 'package:flutter/material.dart';

class BidPercentageBar extends StatelessWidget {
  final double firstPartPercentage, secondPartPercentage;

  const BidPercentageBar({
    Key? key,
    required this.firstPartPercentage,
    required this.secondPartPercentage,
  }) : super(key: key);

  bool _isBidPercentValid(int bitPercent) {
    return bitPercent != 0;
  }

  double _getBorderRadius(double biddingPercentage) {
    return biddingPercentage.toInt() == 0 ? 30.0 : 0;
  }

  bool _isBiddingNotDone(int firstPartPercentage, int secondPartPercentage) {
    return firstPartPercentage == 0 && secondPartPercentage == 0;
  }

  @override
  Widget build(BuildContext context) {
    var isBiddingRatioZero = _isBiddingNotDone(
        firstPartPercentage.toInt(), secondPartPercentage.toInt());

    return Row(
      children: [
        if (_isBidPercentValid(firstPartPercentage.toInt()) ||
            isBiddingRatioZero)
          Expanded(
            flex: isBiddingRatioZero ? 50 : firstPartPercentage.toInt(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF34C1),
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        bottomLeft: const Radius.circular(30.0),
                        topRight: Radius.circular(isBiddingRatioZero
                            ? 0
                            : _getBorderRadius(secondPartPercentage)),
                        bottomRight: Radius.circular(isBiddingRatioZero
                            ? 0
                            : _getBorderRadius(secondPartPercentage))),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      '${isBiddingRatioZero ? 50 : firstPartPercentage.toInt()}%',
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
        if (_isBidPercentValid(secondPartPercentage.toInt()) ||
            isBiddingRatioZero)
          Expanded(
            flex: isBiddingRatioZero ? 50 : secondPartPercentage.toInt(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 6,
                    decoration: BoxDecoration(
                        color: const Color(0xFF8247DF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(isBiddingRatioZero
                                ? 0
                                : _getBorderRadius(firstPartPercentage)),
                            topRight: const Radius.circular(30.0),
                            bottomLeft: Radius.circular(isBiddingRatioZero
                                ? 0
                                : _getBorderRadius(firstPartPercentage)),
                            bottomRight: const Radius.circular(30.0)))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      '${isBiddingRatioZero ? 50 : secondPartPercentage.toInt()}%',
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
