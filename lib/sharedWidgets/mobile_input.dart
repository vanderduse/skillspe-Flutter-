import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';

class MobileNumberInput extends StatefulWidget {
  final Function(String, String) onMobileNumberChanged;

  const MobileNumberInput({Key? key, required this.onMobileNumberChanged})
      : super(key: key);

  @override
  _MobileNumberInputState createState() => _MobileNumberInputState();
}

class _MobileNumberInputState extends State<MobileNumberInput> {
  String selectedCountryCode = '+91';
  TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffD0D1DA),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Color(
                    0xffD0D1DA,
                  ),
                  width: 1.0,
                ),
              ),
            ),
            child: CountryCodePicker(
              flagWidth: MediaQuery.of(context).size.width * 0.1,
              hideMainText: false,
              textStyle: Theme.of(context).textTheme.bodyLarge,
              initialSelection: selectedCountryCode,
              onChanged: (countryCode) {
                setState(() {
                  selectedCountryCode = countryCode.toString();
                });
              },
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: mobileNumberController,
              onChanged: (value) {
                if (value.length <= 10) {
                  widget.onMobileNumberChanged(value, selectedCountryCode);
                } else {
                  // If more than 10 digits, truncate the input
                  mobileNumberController.text = value.substring(0, 10);
                }
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(
                  MediaQuery.of(context).size.height * 0.015,
                ),
                hintText: "Enter your number",
              ),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    mobileNumberController.dispose();
    super.dispose();
  }
}
