import 'package:flutter/material.dart';

class ChallengeStatus extends StatelessWidget {
  final String challengeStatus = 'Live';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _getStatusColor(),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Color of the circle dot
            ),
            margin: const EdgeInsets.only(right: 10),
          ),
          Text(
            challengeStatus,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor() {
    switch (challengeStatus) {
      case 'Live':
        return const Color(0xFFFD1010);
      case 'Completed':
        return Colors.green;
      default:
        return const Color(0xFFF87B20);
    }
  }
}
