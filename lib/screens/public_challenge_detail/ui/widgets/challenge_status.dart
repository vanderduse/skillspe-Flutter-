import 'package:flutter/material.dart';
import 'package:skills_pe/utility/constants.dart';

class ChallengeStatus extends StatelessWidget {
  final String? challengeStatus;

  const ChallengeStatus(this.challengeStatus, {super.key});

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
            _getChallengeStatus(),
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
    switch (challengeStatus?.toLowerCase()) {
      case 'live':
        return const Color(0xFFFD1010);
      case 'completed':
        return Colors.green;
      default:
        return const Color(0xFFF87B20);
    }
  }

  String _getChallengeStatus() {
    switch (challengeStatus?.toLowerCase()) {
      case 'live':
        return LIVE;
      case 'completed':
        return COMPLETED;
      case 'results_pending':
        return RESULTS_PENDING;
      default:
        return "";
    }
  }
}
