import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> data;

  QuizWidget({
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
          height: 240, // Set a fixed height for the horizontal ListView
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
                  child: QuizCard(
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

class QuizCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final String? backgroundColor; // Use nullable string for optional parameter

  const QuizCard({required this.item, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final defaultBackgroundColor =
        '#FF0000'; // Change to your desired shade of red
    final actualBackgroundColor = backgroundColor ?? defaultBackgroundColor;

    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 10, // Blur radius
            offset: Offset(0, 5), // Shadow position
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0.0),
      child: Column(
        children: [
          Expanded(
            // Use Expanded instead of Container for flexible sizing
            flex: 4, // Divide space according to desired ratio (40% : 60%)
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFD5CCFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/4999/4999578.png',
                    width: 54,
                    height: 54,
                    // You can adjust the width and height as needed
                  ),
                ),
              ),
              // Add your desired content for the top section here
            ),
          ),
          // Bottom section with remaining space
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    item['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5), // Adding space between title and date

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      item['date'],
                      style: TextStyle(
                        color: Color(0xFF5C6068), // Text color
                        fontSize: 12.0,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Container(
                            width: 120,
                            padding: EdgeInsets.all(3.0), // Adding padding
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                item['participants'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFDF0CE),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  item['price'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 16), // Adding space between containers
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
                                  'Play',
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
                      ],
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
