import 'dart:math';

import 'package:flutter/material.dart';

class CustomPieChart extends StatelessWidget {
  final double yesPercent, noPercent;

  const CustomPieChart(
      {super.key, required this.yesPercent, required this.noPercent});

  @override
  Widget build(BuildContext context) {
    return PieChart(data: [
      PieChartData(const Color.fromRGBO(255, 52, 193, 0.85), noPercent,
          label: '${noPercent.toInt()}%'),
      PieChartData(Theme.of(context).primaryColor, yesPercent,
          label: '${yesPercent.toInt()}%'),
    ], radius: 40);
  }
}

class PieChart extends StatelessWidget {
  PieChart({
    required this.data,
    required this.radius,
    this.strokeWidth = 15,
    this.child,
    Key? key,
  })  : // Make sure sum of data is never over 100 percent
        assert(data.fold<double>(0, (sum, data) => sum + data.percent) <= 100),
        super(key: key);

  final List<PieChartData> data;
  // Radius of chart
  final double radius;
  // Width of stroke
  final double strokeWidth;
  // Optional child; can be used for text for example
  final Widget? child;

  @override
  Widget build(context) {
    return CustomPaint(
      painter: _Painter(strokeWidth, data),
      size: Size.square(radius * 2),
      child: SizedBox.square(
        // Calculate diameter
        dimension: radius * 2,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

// This is used to pass data about chart values to the widget
class PieChartData {
  const PieChartData(this.color, this.percent, {required this.label});

  final Color color;
  final double percent;
  final String label;
}

class _PainterData {
  const _PainterData(this.paint, this.radians, this.label);

  final Paint paint;
  final double radians;
  final String label;
}

class _Painter extends CustomPainter {
  _Painter(double strokeWidth, List<PieChartData> data) {
    // Convert chart data to painter data
    dataList = data
        .map((e) => _PainterData(
              Paint()
                ..color = e.color
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth
                ..strokeCap = StrokeCap.round,
              // Include padding between segments
              (e.percent - _padding) * _percentInRadians,
              e.label,
            ))
        .toList();
  }

  static const _percentInRadians = 0.062831853071799;
  static const _padding = 7; // Adjust the padding value as needed
  static const _paddingInRadians = _percentInRadians * _padding;
  static const _startAngle = 1.9 + _paddingInRadians / 2;

  late final List<_PainterData> dataList;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    double startAngle = _startAngle;

    for (final data in dataList) {
      final path = Path()..addArc(rect, startAngle, data.radians);

      canvas.drawPath(path, data.paint);

      final angle = startAngle + data.radians / 2;
      final x = (size.width / 2) + (size.width / 2 - 20) * cos(angle);
      final y = (size.height / 2) + (size.height / 2 - 20) * sin(angle);

      final rectWidth = 50.0;
      final rectHeight = 25.0;

      final rectLeft = x - rectWidth / 2;
      final rectTop = y - rectHeight / 2;

      final textRect = Rect.fromLTWH(rectLeft, rectTop, rectWidth, rectHeight);

      final rrect = RRect.fromRectAndRadius(textRect, const Radius.circular(5));

      final gradient = LinearGradient(
        colors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.4)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

      final gradientPaint = Paint()
        ..shader = gradient.createShader(rrect.outerRect);

      canvas.drawRRect(rrect, gradientPaint);

      final textPainter = TextPainter(
        text: TextSpan(
          text: data.label,
          style: const TextStyle(
            color: Color(0xff7E56DA),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      textPainter.paint(
          canvas,
          Offset(rectLeft + (rectWidth - textPainter.width) / 2,
              rectTop + (rectHeight - textPainter.height) / 2));

      startAngle +=
          data.radians + _paddingInRadians; // Include padding between segments
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
