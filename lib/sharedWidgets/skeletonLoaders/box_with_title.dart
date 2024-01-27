import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final bool showTitleContainer;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.showTitleContainer = false,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ];

    if (showTitleContainer) {
      children.insert(
        0,
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: width * 0.4,
            height: 40,
            margin: const EdgeInsets.only(bottom: 10, left: 20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "Title", // Replace with desired placeholder text
                style: TextStyle(color: Colors.grey[100]!),
              ),
            ),
          ),
        ),
      );
    }

    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(185, 223, 223, 223),
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: children,
      ),
    );
  }
}
