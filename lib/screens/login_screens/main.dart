import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_recaptcha/flutter_firebase_recaptcha.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/login_screens/bloc/login_bloc.dart';
import 'package:skills_pe/screens/login_screens/otp.dart';
import 'package:skills_pe/screens/login_screens/repository/send_otp_respository.dart';
import 'package:skills_pe/screens/login_screens/widgets/gradient_title.dart';
import 'package:skills_pe/screens/login_screens/widgets/tnc_text.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/mobile_input.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  String selectedCountryCode = '+91';

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = LoginBloc(SendOTPRepository());
    return Scaffold(
      body: BlocConsumer(
        bloc: loginBloc,
        listener: (BuildContext context, Object? state) {
          print(state);
          switch (state) {
            case LoginLoadingState:
              {
                buildShowDialog(context);
                break;
              }
            case LoginOTPSendSuccessState:
              {
                Navigator.of(context).pop();
                if ((state as LoginOTPSendSuccessState).message != null &&
                    state.message?.isNotEmpty == true) {
                  showSnackBar(context, state.message!);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtpVerification(),
                  ),
                );
              }
            case LoginOTPSendFailureState:
              {
                Navigator.of(context).pop();
              }
          }
          if (state is LoginLoadingState) {
            buildShowDialog(context);
          } else if (state is LoginOTPSendSuccessState) {}
        },
        builder: (context, state) {
          return Container(
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
                            SvgPicture.asset(
                              "assets/skillspe_logo.svg",
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            const GradientTitle(
                                text: CONVERT_YOUR_SKILLS_TITLE),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            MobileNumberInput(
                              onMobileNumberChanged:
                                  (mobileNumber, selectedCountryCode) {
                                this.selectedCountryCode = selectedCountryCode;
                                this.mobileNumber = mobileNumber;
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            FilledBtn(
                              label: SEND_OTP_LABEL,
                              onPressed: () {
                                if (mobileNumber.length == 10) {
                                  setState(() {
                                    showRecaptchaModal = true;
                                  });
                                } else {
                                  showSnackBar(context,
                                      VALID_MOBILE_NUMBER_VALIDATION_MESSAGE);
                                }
                              },
                              backgroundColor: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const TermsAndPrivacyText(),
                            showRecaptchaModal
                                ? SizedBox(
                                    width: double.infinity,
                                    height: 450,
                                    child: FirebaseRecaptchaVerifierModal(
                                      firebaseConfig: firebaseConfig,
                                      onVerify: (token) => {
                                        setState(() {
                                          showRecaptchaModal = false;
                                        }),
                                        loginBloc.add(SendOTPEvent(
                                            mobileNumber: selectedCountryCode +
                                                mobileNumber,
                                            token: token))
                                      },
                                      attemptInvisibleVerification: false,
                                    ),
                                  )
                                : const SizedBox.shrink()
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
          );
        },
      ),
    );
  }
}
