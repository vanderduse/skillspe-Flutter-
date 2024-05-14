import 'package:flutter/material.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/challenge_status.dart';

class PublicChallengeDescription extends StatelessWidget {
  final String challengeStatus;
  final String challengeDate;
  final String source;
  final String totalTraders;

  const PublicChallengeDescription({
    Key? key,
    required this.challengeStatus,
    required this.challengeDate,
    required this.source,
    required this.totalTraders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ChallengeStatus(),
            const SizedBox(
              width: 10,
            ),
            Container(
              constraints:
                  const BoxConstraints(maxWidth: 500), // Set a maximum width
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF8247DF), width: 0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text(
                challengeDate,
                style: const TextStyle(
                  color: Color.fromARGB(255, 131, 131, 131),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Source: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  source,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color(0xFF7E56DA),
                        width: 1), // Outer circle border
                  ),
                  margin: const EdgeInsets.only(right: 8),
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // Color of the outer circle
                    ),
                    child: Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF7E56DA), // Color of the inner circle
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Total Traders: $totalTraders',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7E56DA),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
