import 'dart:async';
import 'package:flutter/material.dart';

class TimerProgressBar extends StatefulWidget {
  final double totalTimeInSeconds;
  final Function()? onCompletion;

  const TimerProgressBar({
    Key? key,
    required this.totalTimeInSeconds,
    this.onCompletion,
  }) : super(key: key);

  @override
  _TimerProgressBarState createState() => _TimerProgressBarState();
}

class _TimerProgressBarState extends State<TimerProgressBar>
    with TickerProviderStateMixin {
  late Timer _timer;
  int _remainingMilliseconds = 0;

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
    _controller.dispose();
    super.dispose();
  }

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _remainingMilliseconds = (widget.totalTimeInSeconds * 1000).toInt();
    _startTimer();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.totalTimeInSeconds.toInt()),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.onCompletion != null) {
          widget.onCompletion!();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      key: UniqueKey(), // Ensure the key changes on each rebuild
      value: 1 - (_remainingMilliseconds / (widget.totalTimeInSeconds * 1000)),
      minHeight: 4.0, // Adjust the height of the progress indicator
      backgroundColor: const Color(0xffF5F5F5), // Background color
      valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).primaryColor), // Progress color
    );
  }
}
