import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:skills_pe/screens/login_screens/widgets/gradient_title.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/buttons/transparent_text_btn.dart';
import 'package:skills_pe/sharedWidgets/vertical_separator.dart';
import 'package:skills_pe/utility/constants.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
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
                        const VerticalSeparator(
                          heightFactor: 0.05,
                        ),
                        const GradientTitle(text: VERIFY_PHONE_NUMBER),
                        const VerticalSeparator(heightFactor: 0.1),
                        PinCodeTextField(
                          appContext: context,
                          length: 6,
                          onChanged: (String value) {
                            print(value);
                          },
                          pinTheme: PinTheme(
                              selectedColor: Theme.of(context).primaryColorDark,
                              errorBorderColor: Color(0xffD0D1DA),
                              inactiveColor: Color(0xffD0D1DA),
                              activeColor: Colors.black),
                          cursorColor: Colors.black,
                          onCompleted: (String value) {},
                        ),
                        const VerticalSeparator(),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: DIDNT_RECEIVE_OTP,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              TransparentTextButton(
                                onPressed: () {
                                  // Your action
                                },
                                label: RESEND_OTP,
                                textColor: Theme.of(context)
                                    .primaryColor, // Optional custom text color
                              ),
                            ],
                          ),
                        ),
                        const VerticalSeparator(),
                        FilledBtn(
                          label: CONTINUE,
                          onPressed: () {
                            try {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const LoginScreen3(),
                              //   ),
                              // );
                            } catch (e) {
                              print('Navigation error: $e');
                            }
                          },
                          backgroundColor: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                        ),
                        const VerticalSeparator(),
                        const VerticalSeparator(),
                        Center(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TransparentTextButton(
                                onPressed: () {
                                  // Your action
                                },
                                label: EDIT_PHONE_NUMBER,
                                textColor: Theme.of(context)
                                    .primaryColor, // Optional custom text color
                              )),
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
