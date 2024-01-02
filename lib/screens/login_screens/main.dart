import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_recaptcha/flutter_firebase_recaptcha.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const firebaseConfig = {
    "apiKey": String.fromEnvironment('FIREBASE_API_KEY'),
    "authDomain": String.fromEnvironment('FIREBASE_AUTH_DOMAIN'),
    "projectId": String.fromEnvironment('FIREBASE_PRODUCT_ID'),
    "storageBucket": String.fromEnvironment('FIREBASE_STORAGE_BUCKET'),
    "messagingSenderId": String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID'),
    "appId": String.fromEnvironment('FIREBASE_APP_ID'),
    "measurementId": String.fromEnvironment('FIREBASE_MEASUREMENT_ID'),
  };
  bool showRecaptchaModal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffe4d8fa), Color(0xffe4d8fa), Colors.white],
            begin: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            "assets/skillspe_logo.svg",
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                          child: GradientText(
                            'Convert Your Skills into Wealth.',
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Epilogue",
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Container(
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
                                  flagWidth:
                                      MediaQuery.of(context).size.width * 0.1,
                                  hideMainText: false,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  initialSelection: 'IN',
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.015,
                                    ),
                                    hintText: "Enter your number",
                                  ),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        FilledBtn(
                          label: "Send Otp",
                          onPressed: () {},
                          backgroundColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                            height: 100, // Adjust as needed
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
                                      },
                                  ),
                                  const TextSpan(
                                    text: " & ",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "privacy policy.",
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
                            )),
                        Container(
                          width: double.infinity,
                          height: 450,
                          child: FirebaseRecaptchaVerifierModal(
                            firebaseConfig: firebaseConfig,
                            onVerify: (token) => {
                              print('token: ' + token),
                              setState(() {
                                showRecaptchaModal = false;
                              })
                            },
                            onLoad: () => print('onLoad'),
                            onError: () => print('onError'),
                            onFullChallenge: () => {
                              print("full challenge"),
                              setState(() {
                                showRecaptchaModal = true;
                              })
                            },
                            attemptInvisibleVerification: !showRecaptchaModal,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.175,
                    right: 0,
                    child: Image.asset('assets/login_page.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
