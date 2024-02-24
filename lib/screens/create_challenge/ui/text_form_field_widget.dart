import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/date_utility.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String formLabel;
  final bool isRequiredField;
  final int maxLines;
  final bool isDateField;
  final bool isAmountTypeField;
  final bool isEmojiField;
  final int challengeFees;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final String? placeholder;
  final bool showFormLabel;

  const TextFormFieldWidget(
      {super.key,
      required this.formLabel,
      required this.isRequiredField,
      this.onChange,
      this.validator,
      this.maxLines = 1,
      this.isDateField = false,
      this.isAmountTypeField = false,
      this.isEmojiField = false,
      this.challengeFees = 5,
      this.placeholder,
      this.showFormLabel = true});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _textEditingController.text = ""; // set the initial value of the text field
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(children: [
        if (widget.showFormLabel) // Conditionally show form label
          Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
            child: Row(
              children: [
                Text(widget.formLabel),
                widget.isRequiredField
                    ? const Align(
                        alignment: Alignment.topLeft,
                        child: Text(STAR),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        TextFormField(
          readOnly: widget.isDateField,
          controller: widget.isDateField
              ? _textEditingController
              : widget.isAmountTypeField
                  ? TextEditingController(text: widget.challengeFees.toString())
                  : null,
          maxLines: widget.maxLines,
          validator: widget.validator,
          onChanged: widget.onChange,
          // maxLength: widget.isAmountTypeField ? 4 : null,
          autovalidateMode: widget.isRequiredField
              ? AutovalidateMode.onUserInteraction
              : null,
          keyboardType: widget.isEmojiField
              ? TextInputType.text
              : widget.isAmountTypeField
                  ? TextInputType.number
                  : widget.isDateField
                      ? TextInputType.datetime
                      : TextInputType.text,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            suffixIcon: widget.isDateField
                ? IconButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        String formattedDate = DateFormat(DDMMYYYY_SLASH_FORMAT)
                            .format(pickedDate);
                        setState(() {
                          _textEditingController.text = formattedDate;
                        });
                      }
                    },
                    icon: const IconTheme(
                      data: IconThemeData(
                        color: Color(0xFF969696),
                        size: 20,
                      ),
                      child: Icon(Icons.calendar_month_outlined),
                    ),
                  )
                : null,
            prefix: widget.isAmountTypeField ? const Text(RUPEE) : null,
            hintText: widget.placeholder ?? '',
            filled: true,
            fillColor: const Color.fromARGB(255, 245, 239, 252),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ]),
    );
  }
}
