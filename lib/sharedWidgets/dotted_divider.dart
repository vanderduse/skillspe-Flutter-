import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double dotRadius;

  const DottedDivider({
    Key? key,
    this.height = 1.0,
    this.color = Colors.grey,
    this.dotRadius = 1.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedLinePainter(
          height: height, color: color, dotRadius: dotRadius),
      child: Container(
        height: height,
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final double height;
  final Color color;
  final double dotRadius; // Rename this to dashWidth for clarity

  _DottedLinePainter({
    required this.height,
    required this.color,
    required this.dotRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = height; // Use height as the thickness of the line

    double startX = 0;
    double dashWidth = dotRadius; // Use dotRadius as the width of each dash
    double dashSpace = dashWidth * 2; // Space between dashes

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, size.height / 2),
          Offset(startX + dashWidth, size.height / 2), paint);
      startX += dashWidth + dashSpace; // Move to the start of the next dash
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
