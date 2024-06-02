import 'package:flutter/material.dart';

class TextThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final String text;

  const TextThumbShape({this.thumbRadius = 20.0, required this.text});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.red // Default color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, paint);

    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize:
            thumbRadius * 0.8, // Adjust font size based on your thumb radius
        fontWeight: FontWeight.w900,
        color: Colors.white, // Text color
      ),
      text: text,
    );

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tp.layout();
    Offset textCenter = Offset(
      center.dx - (tp.width / 2),
      center.dy - (tp.height / 2),
    );

    tp.paint(canvas, textCenter);
  }
}
