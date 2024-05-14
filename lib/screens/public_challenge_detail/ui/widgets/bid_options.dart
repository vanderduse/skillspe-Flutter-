import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/text_thumb_shape.dart';
import 'package:skills_pe/utility/constants.dart';

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
  double _sliderValue = 5;

  @override
  void initState() {
    super.initState();
    _activeCard = widget.activeCard; // Initialize active card from props
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width - 60; // Get the screen width
    return Column(
      children: [
        Row(
          children: [
            // Add some spacing between the cards
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
                child: Card(
                  margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: _activeCard == 'Yes'
                          ? const Color(0xFF7E56DA)
                          : const Color.fromARGB(157, 170, 170, 170),
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
                child: Card(
                  margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: _activeCard == 'No'
                          ? const Color(0xFFFF34C1)
                          : const Color.fromARGB(157, 170, 170, 170),
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
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Card(
              surfaceTintColor: Colors.white,
              color:
                  Colors.white, // Set the background color of the card to white
              elevation: 0.25, // Shadow size
              margin: const EdgeInsets.symmetric(
                  vertical: 10), // Margin around the card
              child: Padding(
                padding: const EdgeInsets.all(15.0), // Padding inside the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize
                      .min, // Fit content in the smallest space possible
                  children: <Widget>[
                    const Text(
                      QUANTITY,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Inter", // Text size
                          fontWeight: FontWeight.w500,
                          height: 1 // Text weight
                          ),
                    ),
                    // Space between text and button
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/stacks.svg",
                          height: 24,
                          width: 24,
                        ),
                        Expanded(
                            child: SliderTheme(
                                data: const SliderThemeData(
                                    thumbColor:
                                        Color.fromRGBO(255, 52, 193, 0.85),
                                    thumbShape: TextThumbShape(
                                        text: '<>', thumbRadius: 12)),
                                child: Slider(
                                  min: 1,
                                  max: 10,
                                  value: _sliderValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _sliderValue = value;
                                    });
                                  },
                                ))),
                        Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text("${_sliderValue.toInt()}"))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
                right:
                    _activeCard == 'No' ? screenWidth / 4.8 : screenWidth / 1.4,
                bottom: 100,
                top: 0,
                child: SvgPicture.asset(
                  "assets/icons/polygon.svg",
                )),
          ],
        )
      ],
    );
  }
}
