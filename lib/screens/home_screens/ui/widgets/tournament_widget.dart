import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/cards/tournament_card.dart';
import 'package:skills_pe/screens/view_all/ui/tournament_list_screen.dart';
import 'package:skills_pe/screens/home_screens/model/list_tournaments_response.dart';

class TournamentWidget extends StatelessWidget {
  final String title;
  final List<TournamentsListResponse> data;

  const TournamentWidget({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Handle the 'View All' button tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TournamentListScreen()),
                  );
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xFF8C50F6), // Customize text color
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15.0),
          height: 530,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width *
                    0.9, // 90% of screen width
                margin: EdgeInsets.symmetric(
                    horizontal: index == 0
                        ? 16.0
                        : (index == data.length - 1 ? 16.0 : 10.0),
                    vertical: 10),
                child: TournamentCard(
                  item: data[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
