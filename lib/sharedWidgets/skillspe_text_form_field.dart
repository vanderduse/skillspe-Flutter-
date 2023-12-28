import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skills_pe/utility/date_utility.dart';

class SkillspeTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool required;
  final String? hintText;
  final String? Function(String?)? validator;
  final int totalLines;
  final TextInputType type;

  const SkillspeTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    this.type = TextInputType.text,
    this.hintText,
    this.required = false,
    this.validator,
    this.totalLines = 1,
  }) : super(key: key);

  @override
  _SkillspeTextFormFieldState createState() => _SkillspeTextFormFieldState();
}

class _SkillspeTextFormFieldState extends State<SkillspeTextFormField> {
  String? defaultValidator(String? value) {
    if (widget.required && (value == null || value.isEmpty)) {
      return widget.hintText ?? 'Please enter some text';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabel(),
        const SizedBox(height: 8),
        buildTextFormField(),
      ],
    );
  }

  Widget buildLabel() {
    return Text(widget.required ? '${widget.label} *' : widget.label);
  }

  Widget buildTextFormField() {
    return TextFormField(
      readOnly: widget.type == TextInputType.datetime,
      onTap: (widget.type == TextInputType.datetime) ? _selectDate : () {},
      keyboardType: widget.type,
      minLines: widget.totalLines,
      maxLines: widget.totalLines * 2,
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: buildInputDecoration(),
      validator: widget.validator ?? defaultValidator,
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      suffixIcon: buildSuffixIcon(),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF0A121A), width: 0.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget? buildSuffixIcon() {
    return (widget.type == TextInputType.datetime)
        ? const Icon(Icons.calendar_month_outlined)
        : null;
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate =
          DateFormat(DDMMYYYY_SLASH_FORMAT).format(pickedDate);
      widget.controller.text = formattedDate;
    }
  }
}
