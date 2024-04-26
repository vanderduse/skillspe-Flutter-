import 'package:flutter/material.dart';

class BidOptions extends StatelessWidget {
  final String challengeStatus;
  final String challengeDate;
  final String source;
  final String totalTraders;

  const BidOptions({
    Key? key,
    required this.challengeStatus,
    required this.challengeDate,
    required this.source,
    required this.totalTraders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: const Color(0xFFFF34C1),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF34C1), // Header background color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0), // Padding inside the container
                    child: const Center(
                      child: Text(
                        'No  |  ₹5',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 13, // Text size
                          fontWeight: FontWeight.bold, // Text weight
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You're contributing",
                        style: TextStyle(
                          color: Color(0xFF3F3F3F), // Text color
                          fontSize: 16, // Text size
                        ),
                      ),
                      SizedBox(height: 5), // Add spacing between texts
                      Center(
                        child: Text(
                          '₹100', // Your value here
                          style: TextStyle(
                            color: Color(0xFF8A8A8A), // Text color
                            fontSize: 24, // Text size
                            fontWeight: FontWeight.bold, // Text weight
                          ),
                        ),
                      ),
                      SizedBox(height: 5), // Add vertical spacing
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          color: Color.fromARGB(
                              113, 158, 158, 158), // Divider color
                          thickness: 1.6, // Divider thickness
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total quantity",
                            style: TextStyle(
                              color: const Color(0xFFFF34C1), // Text color
                              fontSize: 16, // Text size
                            ),
                          ),
                          SizedBox(height: 5), // Add spacing between texts
                          Center(
                            child: Text(
                              '200', // Your value here
                              style: TextStyle(
                                color: const Color(0xFFFF34C1), // Text color
                                fontSize: 24, // Text size
                                fontWeight: FontWeight.bold, // Text weight
                              ),
                            ),
                          ),
                          SizedBox(height: 20), // Add vertical spacing
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 5), // Add some spacing between the cards
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Color(0xFF7E56DA),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF7E56DA), // Header background color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0), // Padding inside the container
                    child: const Center(
                      child: Text(
                        'Yes  |  ₹10',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 13, // Text size
                          fontWeight: FontWeight.bold, // Text weight
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You're contributing",
                        style: TextStyle(
                          color: Color(0xFF3F3F3F), // Text color
                          fontSize: 16, // Text size
                        ),
                      ),
                      SizedBox(height: 5), // Add spacing between texts
                      Center(
                        child: Text(
                          '₹1000', // Your value here
                          style: TextStyle(
                            color: Color(0xFF8A8A8A), // Text color
                            fontSize: 24, // Text size
                            fontWeight: FontWeight.bold, // Text weight
                          ),
                        ),
                      ),
                      SizedBox(height: 8), // Add vertical spacing
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          color: Color.fromARGB(
                              113, 158, 158, 158), // Divider color
                          thickness: 1.6, // Divider thickness
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total quantity",
                            style: TextStyle(
                              color: Color(0xFF7E56DA), // Text color
                              fontSize: 16, // Text size
                            ),
                          ),
                          SizedBox(height: 5), // Add spacing between texts
                          Center(
                            child: Text(
                              '200', // Your value here
                              style: TextStyle(
                                color: Color(0xFF7E56DA), // Text color
                                fontSize: 24, // Text size
                                fontWeight: FontWeight.bold, // Text weight
                              ),
                            ),
                          ),
                          SizedBox(height: 20), // Add vertical spacing
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
