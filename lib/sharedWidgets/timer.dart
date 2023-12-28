import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TimerWidget extends StatefulWidget {
  final double totalTimeInSeconds;
  final Function()? onCompletion;

  const TimerWidget({
    Key? key,
    required this.totalTimeInSeconds,
    this.onCompletion,
  }) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _remainingMilliseconds = 0;

  @override
  void initState() {
    super.initState();
    _remainingMilliseconds = (widget.totalTimeInSeconds * 1000).toInt();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        if (_remainingMilliseconds > 0) {
          _remainingMilliseconds -= 10;
        } else {
          _timer.cancel();
          if (widget.onCompletion != null) {
            widget.onCompletion!();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _remainingMilliseconds ~/ (60 * 1000);
    int seconds = (_remainingMilliseconds ~/ 1000) % 60;
    int milliseconds = _remainingMilliseconds % 1000;

    String formattedTime =
        '$minutes:${seconds.toString().padLeft(2, '0')}:${(milliseconds ~/ 10).toString().padLeft(2, '0')}';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            child: SvgPicture.asset(
              "assets/icons/timer.svg",
              height: 20,
              width: 20,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 4),
            width: 70,
            child: Text(
              formattedTime,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
