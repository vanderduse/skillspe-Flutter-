// custom_checkbox_grid.dart

import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/vertical_separator.dart';
import 'icon_check_button.dart';

class IconCheckboxGrid extends StatefulWidget {
  final List<OptionDetails> options;
  final String label;
  final bool isRequired;
  final bool multiSelect; // New parameter to handle multi-select

  const IconCheckboxGrid({
    Key? key,
    required this.label,
    required this.options,
    this.isRequired = false,
    this.multiSelect = false, // Default is single-select
  }) : super(key: key);

  @override
  _IconCheckboxGridState createState() => _IconCheckboxGridState();
}

class _IconCheckboxGridState extends State<IconCheckboxGrid> {
  late List<bool> selectedStates;

  @override
  void initState() {
    super.initState();
    // Initialize the selectedStates list with all false initially
    selectedStates = List.generate(widget.options.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.label + (widget.isRequired ? "*" : ""),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
        ),
        const VerticalSeparator(),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 3,
            childAspectRatio: (106 / 48),
          ),
          shrinkWrap: true,
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            return IconCheckButton(
              iconPath: widget.options[index].iconPath,
              iconAccentColor: widget.options[index].accentColor,
              value: widget.options[index].value,
              isSelected:
                  selectedStates[index], // Pass the multiSelect parameter
              onTap: () {
                // Handle selection logic here
                setState(() {
                  if (widget.multiSelect) {
                    // If multiSelect is true, toggle the selection
                    selectedStates[index] = !selectedStates[index];
                  } else {
                    // If multiSelect is false, clear previous selections and select the current one
                    selectedStates =
                        List.generate(widget.options.length, (i) => i == index);
                  }
                });
              },
            );
          },
        ),
      ],
    );
  }
}

class OptionDetails {
  final String iconPath;
  final Color accentColor;
  final String value;

  OptionDetails({
    required this.iconPath,
    required this.accentColor,
    required this.value,
  });
}
