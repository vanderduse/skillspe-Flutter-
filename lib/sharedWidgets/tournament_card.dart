import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:skills_pe/screens/home_screens/model/list_tournaments_response.dart';

class TournamentCard extends StatelessWidget {
  final TournamentsListResponse item;
  final dynamic leftBorderColor;

  const TournamentCard(
      {super.key, required this.item, this.leftBorderColor = '#ED5E91'});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;

    // List<Map<String, dynamic>> matches =
    //     (item['matches'] as List?)?.cast<Map<String, dynamic>>() ?? [];
    // print("Tournament data ======> $matches");

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
            offset: Offset(0, 5),
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
              // child: Image.network(
              //   item['banner_image'],
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          const SizedBox(height: 10),
          // for (int i = 0; i < min(displayMatchesCount, matches.length); i++)
          //   _buildMatchDetails(matches[i]),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextButton(
                onPressed: () {
                  // Handle the onPressed event, e.g., navigate to more matches screen
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View All Matches ',
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

  Widget _buildMatchDetails(Map<String, dynamic> match) {
    String startTime = match['start_time'];

    // Ensure that 'teams' is a List<Map<String, dynamic>> or an empty list
    List<Map<String, dynamic>> teams = [];
    if (match['teams'] is List) {
      for (var team in match['teams']) {
        if (team is Map<String, dynamic>) {
          teams.add(team);
        } else {
          print('Unexpected team data: $team');
        }
      }
    } else {
      print('Unexpected teams data type: ${match['teams']}');
    }

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
                startTime,
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
              for (int i = 0; i < teams.length && i < 2; i++)
                _buildTeamOption(
                  teams[i]['name'],
                  Color(int.parse('0xFF${teams[i]['team_accent']}')),
                ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF7E56DA),
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
