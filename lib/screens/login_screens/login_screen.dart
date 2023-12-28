import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:skills_pe/screens/login_screens/login_screen_2.dart';
import 'package:flutter_firebase_recaptcha/flutter_firebase_recaptcha.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String defaultCountryCode = "+1";
  CountryCode? selectedCountry = CountryCode.fromCode('US');
  static const firebaseConfig = {
    "apiKey": String.fromEnvironment('FIREBASE_API_KEY'),
    "authDomain": String.fromEnvironment('FIREBASE_AUTH_DOMAIN'),
    "projectId": String.fromEnvironment('FIREBASE_PRODUCT_ID'),
    "storageBucket": String.fromEnvironment('FIREBASE_STORAGE_BUCKET'),
    "messagingSenderId": String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID'),
    "appId": String.fromEnvironment('FIREBASE_APP_ID'),
    "measurementId": String.fromEnvironment('FIREBASE_MEASUREMENT_ID'),
  };

  @override
  Widget build(BuildContext context) {
    print(const String.fromEnvironment('FIREBASE_API_KEY'));

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffe4d8fa), Colors.white],
            begin: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            FirebaseRecaptchaVerifierModal(
              firebaseConfig: firebaseConfig,
              onVerify: (token) => print('token: ' + token),
              onLoad: () => print('onLoad'),
              onError: () => print('onError'),
              onFullChallenge: () => print('onFullChallenge'),
              attemptInvisibleVerification: true,
            ),
            // Logo and text widgets
            const LogoAndTextWidget(),

            // Widget for phone number input
            PhoneNumberInputWidget(
              selectedCountry: selectedCountry,
              defaultCountryCode: defaultCountryCode,
            ),
          ],
        ),
      ),
    );
  }
}

class LogoAndTextWidget extends StatelessWidget {
  const LogoAndTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(width * 0.02, height * 0.1, 0, 0),
              height: height * 0.07,
              width: width * 0.07,
              child: Image.asset('assets/skills_pe_logo.png'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.1, 0, 0),
              child: const AutoSizeText(
                'Skillspe',
                style: TextStyle(fontSize: 30),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.2, 0, 0),
          child: GradientText(
            'Convert Your Skills \n into Wealth',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            gradientType: GradientType.radial,
            radius: 1,
            colors: const [
              Color(0xffffc679),
              Color(0xffff36bd),
              Color(0xffa142db),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(width * 0.86, height * 0.1, 0, 0),
          child: Image.asset('assets/login_page.png'),
        ),
      ],
    );
  }
}

class PhoneNumberInputWidget extends StatelessWidget {
  late final CountryCode? selectedCountry;
  final String defaultCountryCode;

  PhoneNumberInputWidget({
    Key? key,
    required this.selectedCountry,
    required this.defaultCountryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
        height: height * 0.35,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(10, 10),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.02, height * 0.03, 0, height * 0.02),
              child: const AutoSizeText(
                "What's your number ?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      width * 0.02, height * 0.02, width * 0.03, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (CountryCode? countryCode) {
                          // Update selected country
                          selectedCountry = countryCode;
                        },
                        initialSelection: 'IN', // Set the initial country
                        favorite: const [
                          'US',
                          'GB',
                          'IN',
                          'AU'
                        ], // Your favorite countries
                      ),
                    ],
                  ),
                ),
                SizedBox(width: width * 0.01),
                // Mobile Number TextField
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, height * 0.02, width * 0.02, 0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter mobile number",
                        labelText: "Number",
                        contentPadding: EdgeInsets.symmetric(
                          vertical: width * 0.01,
                          horizontal: height * 0.02,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            ElevatedButton(
              onPressed: () {
                try {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen2(),
                    ),
                  );
                } catch (e) {
                  // Handle navigation error here
                  print('Navigation error: $e');
                }
              },
              child: const Text('Send OTP'),
            ),
            SizedBox(height: height * 0.02),
            Padding(
                padding: EdgeInsets.fromLTRB(width * 0.06, 0, width * 0.02, 0),
                child: AutoSizeText.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(
                        text:
                            "By entering your number, you are agreeing to our ",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: "terms of service",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle the tap action for the "terms of service" link
                            // You can navigate to a new page or website here.
                          },
                      ),
                      const TextSpan(
                        text: " & ",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: "privacy policy",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle the tap action for the "privacy policy" link
                            // You can navigate to a new page or website here.
                          },
                      ),
                      const TextSpan(
                        text: ", thanks!",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}
