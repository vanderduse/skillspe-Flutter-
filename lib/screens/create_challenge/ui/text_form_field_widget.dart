import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:skills_pe/utility/constants.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String formLabel;
  final bool isRequiredField;
  final int maxLines;
  final bool isDateField;
  final bool isAmountTypeField;
  final int challengeFees;
  final String? Function(String?)? validator;
  final Function(String)? onChange;

  TextFormFieldWidget({
    super.key,
    required this.formLabel,
    required this.isRequiredField,
    this.onChange,
    this.validator,
    this.maxLines = 1,
    this.isDateField = false,
    this.isAmountTypeField = false,
    this.challengeFees = 5,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _textEditingController.text = ""; //set the initial value of text field
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
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
          child: Row(
            children: [
              Text(widget.formLabel),
              widget.isRequiredField
                  ? const Align(
                      alignment: Alignment.topLeft,
                      child: Text(star),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        TextFormField(
            controller: widget.isDateField
                ? _textEditingController
                : widget.isAmountTypeField
                    ? TextEditingController(
                        text: widget.challengeFees.toString())
                    : null,
            maxLines: widget.maxLines,
            validator: widget.validator,
            onChanged: widget.onChange,
            maxLength: widget.isAmountTypeField ? 4 : null,
            autovalidateMode: widget.isRequiredField
                ? AutovalidateMode.onUserInteraction
                : null,
            keyboardType: widget.isAmountTypeField
                ? TextInputType.number
                : widget.isDateField
                    ? TextInputType.datetime
                    : TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              suffixIcon: widget.isDateField
                  ? IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context, //context of current state
                            initialDate: DateTime.now(),
                            firstDate: DateTime
                                .now(), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          setState(() {
                            _textEditingController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_month_outlined))
                  : null,
              prefix: widget.isAmountTypeField ? const Text(rupee) : null,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))),
            ))
      ]),
    );
  }
}
