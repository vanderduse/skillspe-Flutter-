import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LargeNumericTextField extends StatelessWidget {
  const LargeNumericTextField({
    Key? key,
    required this.controller,
    required this.errorText,
    this.disabled = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String? errorText;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
      ],
      style: TextStyle(
        color: disabled ? Colors.grey : Colors.black,
        fontSize: 32.0,
        fontFamily: 'Inter',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 16.0,
        ),
        hintText: 'Enter Amount',
        hintStyle: TextStyle(
          color: disabled ? Colors.grey : Color(0xFF5C6068),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: disabled ? Colors.grey : Color(0xFFD0D1DA),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: disabled ? Colors.grey : Color(0xFFD0D1DA),
            width: 1.0,
          ),
        ),
        errorText: errorText,
      ),
      validator: (value) {
        if (disabled) {
          return null; // No validation for disabled state
        }
        if (value == null || value.isEmpty) {
          return 'Please enter a valid number.';
        }
        // You can add more specific validation logic if needed
        return null;
      },
      enabled: !disabled,
    );
  }
}
