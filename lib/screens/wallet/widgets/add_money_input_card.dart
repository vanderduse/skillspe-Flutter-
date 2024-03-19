import 'package:flutter/material.dart';
import 'package:skills_pe/screens/wallet/widgets/large_numeric_text_field.dart';
import 'package:skills_pe/sharedWidgets/cards/card.dart';
import 'package:skills_pe/sharedWidgets/clickable_chip.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/vertical_separator.dart';
import 'package:skills_pe/utility/constants.dart';

class AddMoneyInputCard extends StatefulWidget {
  const AddMoneyInputCard({super.key});

  @override
  State<AddMoneyInputCard> createState() => _AddMoneyInputCardState();
}

class _AddMoneyInputCardState extends State<AddMoneyInputCard> {
  bool isDisabled = false;
  TextEditingController _amountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CardWithShadow(
      backgroundColor: Colors.white,
      childWidget: Column(
        children: [
          const Text(TOPUP_WALLET),
          const VerticalSeparator(),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  LargeNumericTextField(
                      disabled: isDisabled,
                      controller: _amountController,
                      errorText: null //"Please enter the amount",
                      ),
                  const VerticalSeparator(
                    heightFactor: 0.01,
                  ),
                  Wrap(
                    spacing: 12.0, // Adjust the spacing between chips
                    runSpacing:
                        8.0, // Adjust the run spacing between chip lines
                    children: TOPUP_AMOUNTS.map((element) {
                      return ClickableChip(
                        textColor: isDisabled
                            ? const Color.fromARGB(255, 148, 148, 148)
                            : const Color(0xff0A121A),
                        chipColor: const Color(0xffD0D1DA),
                        onPressed: () {
                          if (!isDisabled)
                            _amountController.text = element.toString();
                        },
                        text: '₹ $element',
                      );
                    }).toList(),
                  ),
                  const VerticalSeparator(
                    heightFactor: 0.03,
                  ),
                  FilledBtn(
                      label: ADD_MONEY,
                      onPressed: () {
                        _validate();
                      },
                      backgroundColor: Theme.of(context).primaryColor,
                      textColor: Colors.white),
                ],
              ))
        ],
      ),
    );
  }

  bool _validate() {
    if (_formKey.currentState!.validate()) {
      // Validated successfully, handle the form data
      return true;
    } else {
      // Validation failed
      return false;
    }
  }
}
