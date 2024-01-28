import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:skills_pe/screens/home_screens/model/list_tournaments_response.dart';
import 'package:skills_pe/utility/date_utility.dart';

class TournamentCard extends StatelessWidget {
  final TournamentsListResponse item;

  const TournamentCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    print("item===========> ${item.bannerImage}");
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;

    List<Matches> matches = item.matches!;

    int displayMatchesCount = 2; // Display only the top 2 matches

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 14),
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
            item.title!,
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
                item.bannerImage!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          for (int i = 0; i < min(displayMatchesCount, matches.length); i++)
            _buildMatchDetails(matches[i]),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
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
          ),
        ],
      ),
    );
  }

  Widget _buildMatchDetails(Matches match) {
    List<Teams> teams = match.teams!;

    if (teams.isEmpty) {
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
          margin: const EdgeInsets.symmetric(vertical: 8),
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
                formatTournamentStartTime(match.startTime!),
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
            children: [
              _buildTeamOption(
                teams[0].name!,
                Color(int.parse('0xFF${teams[0].teamAccent}')),
              ),
              // Use a Column to vertically align the versus icon with margin
              Container(
                margin: const EdgeInsets.only(bottom: 14),
                child: SvgPicture.asset(
                  'assets/icons/versus.svg',
                  width: 30,
                  height: 30,
                ),
              ),
              _buildTeamOption(
                teams[1].name!,
                Color(int.parse('0xFF${teams[1].teamAccent}')),
              ),

              // Add a gap between the second team container and "Predict & Win" button
              SizedBox(width: 50),

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

  Widget _buildTeamOption(String text, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: SvgPicture.asset(
              'assets/icons/t-shirt-white.svg',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

