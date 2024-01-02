import 'package:flutter/material.dart';

class VerticalSeparator extends StatelessWidget {
  final double heightFactor;

  const VerticalSeparator({Key? key, this.heightFactor = 0.02})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightFactor,
    );
  }
}
