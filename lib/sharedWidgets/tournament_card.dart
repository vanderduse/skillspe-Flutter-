import 'package:flutter/material.dart';
import 'dart:math';
import 'package:skills_pe/screens/home_screens/model/list_tournaments_response.dart';
import 'package:skills_pe/screens/tournaments/widgets/team_name_with_icon.dart';
import 'package:skills_pe/utility/date_utility.dart';

class TournamentCard extends StatelessWidget {
  final TournamentsListResponse item;

  const TournamentCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;
    List<Matches> matches = item.matches ?? [];
    int displayMatchesCount = 2; // Display only the top 2 matches

    return Container(
      padding: const EdgeInsets.all(15),
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title ?? "",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                "https://img.freepik.com/free-vector/gradient-national-sports-day-illustration_23-2148995776.jpg?w=1480&t=st=1707417363~exp=1707417963~hmac=a72602ab69f0fded9c163d908ad6c720f34ee9d1f589a944ea4e17d4e138e46b",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          for (int i = 0; i < min(displayMatchesCount, matches.length); i++)
            _buildMatchDetails(matches[i]),
          Center(
            child: TextButton(
              onPressed: () {
                // Handle the onPressed event in future
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View all matches ',
                    style: TextStyle(
                      color: Color(0xFF8C50F6),
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF8C50F6),
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchDetails(Matches? match) {
    //print('${match?.teams?.length}');
    List<Teams>? teams = match?.teams;

    if (teams == null || teams.isEmpty == true) {
      // Handle the case where 'teams' is empty
      return const Text(
        'No teams available for this match',
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      );
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          child: Row(
            children: [
              const Expanded(
                child: Divider(
                  color: Color.fromRGBO(160, 160, 160, 0.5),
                  thickness: 1.2,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                formatTournamentStartTime(match?.startTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(160, 160, 160, 1),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Divider(
                  color: Color.fromRGBO(160, 160, 160, 0.5),
                  thickness: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(bottom: 10), // Add margin to the bottom
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TeamNameWithIcon(
                      teamName: teams[0].teamName,
                      iconColor:
                          "0xff${teams[0].teamAccent?.replaceAll("#", "")}"),
                  const SizedBox(
                    height: 10,
                  ),
                  TeamNameWithIcon(
                      teamName: teams[1].teamName,
                      iconColor:
                          "0xff${teams[1].teamAccent?.replaceAll("#", "")}"),
                ],
              ),
              // "Predict & Win" Button Container
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF7E56DA),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Predict & win',
                    style: TextStyle(color: Color(0xFF7E56DA)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
