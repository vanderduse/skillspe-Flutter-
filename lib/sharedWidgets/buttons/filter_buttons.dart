import 'package:flutter/material.dart';

class ButtonGroup extends StatefulWidget {
  final List<String> buttonNames; // List of button names
  final Function(int) onItemSelected; // Callback function for selected button
  final int selectedIndex;
  const ButtonGroup(
      {super.key,
      required this.buttonNames,
      required this.onItemSelected,
      this.selectedIndex = 0});

  @override
  ButtonGroupState createState() => ButtonGroupState();
}

class ButtonGroupState extends State<ButtonGroup> {
  int _selectedIndex = 0; // Track active button index

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  void _handleButtonTap(int buttonIndex) {
    setState(() {
      _selectedIndex = buttonIndex;
      widget.onItemSelected(buttonIndex); // Call callback with selected index
    });
  }

  void updateSelectedIndex(int selectedIndex) {
    print(selectedIndex);
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: List.generate(widget.buttonNames.length, (buttonIndex) {
          final isSelected =
              _selectedIndex == buttonIndex; // Check if button is active
          return Padding(
            padding: EdgeInsets.fromLTRB(
              buttonIndex == 0
                  ? 20.0
                  : 4.0, // Left padding for the first button
              0.0,
              buttonIndex == widget.buttonNames.length - 1
                  ? 20.0
                  : 4.0, // Right padding for the last button
              0.0,
            ),
            child: GestureDetector(
              onTap: () => _handleButtonTap(buttonIndex),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFEBE5F5) : Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF8C50F6)
                        : const Color(0xFFD0D1DA),
                    width: 1.0,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  widget.buttonNames[buttonIndex],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
