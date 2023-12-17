import 'package:flutter/material.dart';

class ChallengesWidget extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> data;

  ChallengesWidget({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
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
          height: 200, // Set a fixed height for the horizontal ListView
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% of screen width
                  margin: EdgeInsets.symmetric(
                    horizontal: index == 0
                        ? 16.0
                        : (index == data.length - 1 ? 16.0 : 10.0),
                  ),
                  child: ChallengeCard(
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

class ChallengeCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final dynamic leftBorderColor;

  const ChallengeCard({required this.item, this.leftBorderColor = '#ED5E91'});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final cardWidth = screenWidth * 0.9;
    final leftWidth = cardWidth * 0.02;
    final middleWidth = cardWidth * 0.15;

    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 14),
      padding: EdgeInsets.only(top: 15, bottom: 10, right: 15),
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 8, // Blur radius
            offset: Offset(0, 5), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: leftWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    child: Center(
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xFFED5E91),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: middleWidth,
            child: Center(
              child: ClipRect(
                child: SizedBox(
                  width: 28.0,
                  height: 28.0,
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/3176/3176382.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow[100], // Change this to your desired color
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 50.0),
                            child: Container(
                              child: Text(
                                item["title"],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                                8, // Adding some space between title and tag
                          ),

// Container for the tag with fixed width
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: SizedBox(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right:
                                        140.0), // Use const for unchanged EdgeInsets
                                decoration: BoxDecoration(
                                  color: const Color(
                                      0xFFF5F5F5), // Use const for unchanged color
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical:
                                            2), // Use const for unchanged EdgeInsets
                                    child: Text(
                                      item['type'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors
                          .white, // Setting bottom section background color to white

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // First container displaying text
                          Container(
                            width: 140,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              item['date'],
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),

                          // Second container for the button
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1.1,
                                  color: Color(0xFF8C50F6)), // Border color
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 22, vertical: 10),
                            child: Text(
                              'Bid',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFF8C50F6), // Text color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
