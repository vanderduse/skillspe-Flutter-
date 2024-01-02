import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skills_pe/utility/constants.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        children: <InlineSpan>[
          const TextSpan(
            text: TERMS_AND_PRIVACY_TEXT,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: TERMS_OF_SERVICE,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle the tap action for the "terms of service" link
              },
          ),
          const TextSpan(
            text: " & ",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: PRIVACY_POLICY,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle the tap action for the "privacy policy" link
              },
          ),
        ],
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
