import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool checked;
  final VoidCallback onChanged;

  const CustomCheckbox({
    Key? key,
    required this.checked,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          unselectedWidgetColor: Colors.transparent, // Hide checkbox outline
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(
              widget.checked ? Color(0xFF7E56DA) : Colors.transparent,
            ),
            checkColor: MaterialStateProperty.all(Colors.white),
            side: const BorderSide(
              width: 1.5,
              color: Color(0xFF7E56DA),
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
        child: Transform.scale(
          scale: 1.25,
          child: Checkbox(
            value: widget.checked,
            onChanged: (state) => {},
          ),
        ));
  }
}
