import 'package:flutter/material.dart';

class BiddingConfirmedScreen extends StatelessWidget {
  const BiddingConfirmedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(200, 105, 141, 0.9),
          Color.fromRGBO(53, 18, 123, 0.9),
          Color.fromRGBO(98, 1, 109, 1),
          Color.fromRGBO(53, 18, 123, 1),
          Color.fromRGBO(53, 18, 123, 1),
          Color.fromRGBO(53, 18, 123, 1),
        ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
      ),
    );
  }
}
