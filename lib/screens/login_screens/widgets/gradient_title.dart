import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class GradientTitle extends StatelessWidget {
  final String text;

  const GradientTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GradientText(
        text,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          fontFamily: "Epilogue",
        ),
        gradientType: GradientType.radial,
        radius: 1,
        colors: const [
          Color(0xffffc679),
          Color(0xffff36bd),
          Color(0xffa142db),
        ],
      ),
    );
  }
}
