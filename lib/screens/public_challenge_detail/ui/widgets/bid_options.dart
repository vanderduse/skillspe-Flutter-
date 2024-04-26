import 'package:flutter/material.dart';

class BidOptions extends StatefulWidget {
  final String? activeCard; // Active card identifier
  final Function(String)? onPressed; // OnPress event function

  const BidOptions({
    Key? key,
    this.activeCard,
    this.onPressed,
  }) : super(key: key);

  @override
  _BidOptionsState createState() => _BidOptionsState();
}

class _BidOptionsState extends State<BidOptions> {
  String? _activeCard; // Variable to track the active card

  @override
  void initState() {
    super.initState();
    _activeCard = widget.activeCard; // Initialize active card from props
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (_activeCard != 'No') {
                setState(() {
                  _activeCard = 'No'; // Set the active card to 'No'
                });
                if (widget.onPressed != null) {
                  widget.onPressed!('No');
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: _activeCard == 'No'
                        ? Color(0xFFFF34C1)
                        : Color.fromARGB(157, 170, 170, 170),
                    width: 1,
                  ),
                ),
                elevation:
                    _activeCard == 'No' ? 8 : 0, // Add elevation if active
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF34C1), // Header background color
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
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
                        SizedBox(height: 8), // Add vertical spacing
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
                              "Win up to",
                              style: TextStyle(
                                color: Color(0xFFFF34C1), // Text color
                                fontSize: 16, // Text size
                              ),
                            ),
                            SizedBox(height: 5), // Add spacing between texts
                            Center(
                              child: Text(
                                '200', // Your value here
                                style: TextStyle(
                                  color: Color(0xFFFF34C1), // Text color
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
        ),
        const SizedBox(width: 5), // Add some spacing between the cards
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (_activeCard != 'Yes') {
                setState(() {
                  _activeCard = 'Yes'; // Set the active card to 'Yes'
                });
                if (widget.onPressed != null) {
                  widget.onPressed!('Yes');
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: _activeCard == 'Yes'
                        ? Color(0xFF7E56DA)
                        : Color.fromARGB(157, 170, 170, 170),
                    width: 1,
                  ),
                ),
                elevation:
                    _activeCard == 'Yes' ? 8 : 0, // Add elevation if active
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFF7E56DA), // Header background color
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
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
                              "Win up to",
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
        ),
      ],
    );
  }
}
