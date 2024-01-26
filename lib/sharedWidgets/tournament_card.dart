import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TournamentCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final dynamic leftBorderColor;

  const TournamentCard({required this.item, this.leftBorderColor = '#ED5E91'});
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;

    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 14),
      padding: EdgeInsets.all(15),
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
            item['title'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 150, // Set the desired height of the image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                item['banner_image'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8), // Adding vertical margin
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color.fromRGBO(160, 160, 160, 0.5),
                    thickness: 1.2,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Round 1 | 06 Oct 23',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(160, 160, 160, 1),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Divider(
                    color: Color.fromRGBO(160, 160, 160, 0.5),
                    thickness: 1.2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTeamOption('Team E', Color(0xFFA64242)),
                  SizedBox(height: 5),
                  _buildTeamOption('Team H', Color(0xFF425EA6)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xFF7E56DA)), // Button border color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Predict & win',
                    style: TextStyle(color: Color(0xFF7E56DA)),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8), // Adding vertical margin
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color.fromRGBO(160, 160, 160, 0.5),
                    thickness: 1.2,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Round 2 | 20 Oct 23',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(160, 160, 160, 1),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Divider(
                    color: Color.fromRGBO(160, 160, 160, 0.5),
                    thickness: 1.2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTeamOption('Team E', Color(0xFF9942A6)),
                  SizedBox(height: 5),
                  _buildTeamOption('Team H', Color(0xFFED6F5E)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xFF7E56DA)), // Button border color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Predict & win',
                    style: TextStyle(color: Color(0xFF7E56DA)),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: TextButton(
                onPressed: () {
                  // Handle the onPressed event, e.g., navigate to more matches screen
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View All Matches ',
                      style: TextStyle(
                        color:
                            Color(0xFF8C50F6), // Change to your desired color
                        fontSize: 14,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF8C50F6),
                      size: 16, // Change to your desired color
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

  Widget _buildTeamOption(String text, Color color) {
    return Row(
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
              'assets/icons/t-shirt-white.svg', // Replace 'assets/tshirt.svg' with your SVG file path
            ),
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
