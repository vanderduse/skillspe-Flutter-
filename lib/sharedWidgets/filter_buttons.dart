import 'package:flutter/material.dart';

class ButtonGroup extends StatefulWidget {
  final List<String> buttonNames; // List of button names
  final Function(int) onItemSelected; // Callback function for selected button

  const ButtonGroup({required this.buttonNames, required this.onItemSelected});

  @override
  _ButtonGroupState createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  int _selectedIndex = 0; // Track active button index

  void _handleButtonTap(int buttonIndex) {
    setState(() {
      _selectedIndex = buttonIndex;
      widget.onItemSelected(buttonIndex); // Call callback with selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // Wrap buttons for row-wise alignment
      spacing: 2.0, // Spacing between buttons
      children: List.generate(widget.buttonNames.length, (buttonIndex) {
        final isSelected =
            _selectedIndex == buttonIndex; // Check if button is active
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 4.0), // Button padding
          child: GestureDetector(
            // Wrap with GestureDetector for tap handling
            onTap: () => _handleButtonTap(buttonIndex), // Handle button tap
            child: Container(
              decoration: BoxDecoration(
                // Button decoration
                color: isSelected
                    ? Color(0xFFEBE5F5)
                    : Colors
                        .white, // Set background color based on active state
                borderRadius:
                    BorderRadius.circular(20.0), // Button border radius
                border: Border.all(
                  // Button border
                  color: isSelected
                      ? Color(0xFF8C50F6)
                      : Color(
                          0xFFD0D1DA), // Set border color based on active state
                  width: 1.0, // Border width
                ),
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 5.0), // Button content padding
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                // Button text
                widget.buttonNames[buttonIndex],
                style: const TextStyle(
                  // Text style
                  color: Colors.black, // Text color always black
                  fontSize: 14.0, // Text size
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
