import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/tournament_card.dart';
import 'package:skills_pe/screens/view_all/ui/view_all_tournament.dart';

class TournamentWidget extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> data;

  TournamentWidget({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    print("tounrmanet item: $data");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Handle the 'View All' button tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewAllTournament()),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xFF8C50F6), // Customize text color
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 500, // Set a fixed height for the horizontal ListView
          child: Container(
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
                  ),
                  child: TournamentCard(
                    item: data[index],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
