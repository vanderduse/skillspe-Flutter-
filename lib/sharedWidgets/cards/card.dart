import 'package:flutter/material.dart';

class CardWithShadow extends StatelessWidget {
  final Color backgroundColor;
  final Widget childWidget;
  const CardWithShadow(
      {super.key, required this.backgroundColor, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: backgroundColor,
        shadows: const [
          BoxShadow(
            color: Color(0x19717C86),
            blurRadius: 8,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: childWidget,
    );
  }
}
