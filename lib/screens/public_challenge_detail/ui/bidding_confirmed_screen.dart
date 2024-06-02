import 'package:flutter/material.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/bidding_confirmation_animation.dart';

class BiddingConfirmedScreen extends StatelessWidget {
  const BiddingConfirmedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pop(context, "Bidding Confirmed");
    });
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(200, 105, 141, 0.9),
          Color.fromRGBO(53, 18, 123, 0.9),
          Color.fromRGBO(98, 1, 109, 1),
          Color.fromRGBO(53, 18, 123, 1),
          Color.fromRGBO(53, 18, 123, 1),
          Color.fromRGBO(53, 18, 123, 1),
        ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
        child: BiddingConfirmationAnimation(),
      ),
    );
  }
}
