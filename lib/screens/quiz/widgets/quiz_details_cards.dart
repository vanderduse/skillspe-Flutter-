import 'package:flutter/material.dart';
import 'package:skills_pe/screens/quiz/widgets/quiz_status.dart';

class QuizDetailContainer extends StatelessWidget {
  final String bannerImageUrl;
  final String title;
  final String description;
  final String status;

  const QuizDetailContainer(
      {Key? key,
      required this.bannerImageUrl,
      required this.title,
      required this.description,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19717C86),
            blurRadius: 8,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(bannerImageUrl),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                SizedBox(
                  width: 318,
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          QuizStatus(status: status)
        ],
      ),
    );
  }
}
