import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BiddingConfirmationAnimation extends StatefulWidget {
  @override
  _BiddingConfirmationAnimationState createState() =>
      _BiddingConfirmationAnimationState();
}

class _BiddingConfirmationAnimationState
    extends State<BiddingConfirmationAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0.0, 0.5), // Start at the top-left corner
      end: const Offset(0.0, 0.4), // End at the bottom-right corner
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        return FractionalTranslation(
          translation: _animation!.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/bidding_successful.svg'),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Bidding',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
              ),
              const Text(
                'Successful!',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    fontSize: 24),
              )
            ],
          ),
        );
      },
    );
  }
}
