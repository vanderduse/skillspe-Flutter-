import 'package:flutter/material.dart';
import 'package:skills_pe/screens/home_screens/model/list_private_challenges_response.dart';
import 'package:skills_pe/screens/home_screens/ui/widgets/challenge_card_factory.dart';
import 'package:skills_pe/sharedWidgets/cards/live_challenge_card.dart';
import 'package:skills_pe/screens/view_all/ui/private_challenges_list_screen.dart';
import 'package:skills_pe/utility/constants.dart';

class PrivateChallengesWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<PrivateChallengesListResponse> data;

  const PrivateChallengesWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 8.0, top: 20.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E1452),
                    ),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF5C6068),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivateChallengesListScreen(),
                    ),
                  );
                },
                child: const Text(
                  SEE_ALL,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8C50F6),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15.0),
          height: 290, // Set a fixed height for the horizontal ListView
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final challengeCard = _getChallengeCard(data[index]);
              return Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: EdgeInsets.symmetric(
                  horizontal: index == 0
                      ? 16.0
                      : (index == data.length - 1 ? 16.0 : 10.0),
                ),
                child: challengeCard,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _getChallengeCard(PrivateChallengesListResponse item) {
    final factory =
        ChallengeCardFactory.getChallengeCardFactory(item.status ?? "");
    return factory.createChallengeCard(item); // Return Widget directly
  }
}
