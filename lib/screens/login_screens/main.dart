import 'package:flutter/material.dart';
import 'package:flutter_firebase_recaptcha/flutter_firebase_recaptcha.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/login_screens/otp.dart';
import 'package:skills_pe/screens/login_screens/widgets/gradient_title.dart';
import 'package:skills_pe/screens/login_screens/widgets/tnc_text.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/mobile_input.dart';
import 'package:skills_pe/utility/constants.dart';

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
  String mobileNumber = '';

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
                        const GradientTitle(text: CONVERT_YOUR_SKILLS_TITLE),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        MobileNumberInput(
                          onMobileNumberChanged: (value) {
                            setState(() {
                              mobileNumber = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        FilledBtn(
                          label: SEND_OTP_LABEL,
                          onPressed: () {
                            try {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OtpVerification(),
                                ),
                              );
                            } catch (e) {
                              // Handle navigation error here
                              print('Navigation error: $e');
                            }
                          },
                          backgroundColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const TermsAndPrivacyText(),
                        SizedBox(
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
