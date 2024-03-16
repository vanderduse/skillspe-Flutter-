import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:skills_pe/screens/home_screens/ui/main.dart';
import 'package:skills_pe/screens/login_screens/bloc/login_bloc.dart';
import 'package:skills_pe/screens/login_screens/repository/send_otp_respository.dart';
import 'package:skills_pe/screens/login_screens/widgets/gradient_title.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/buttons/transparent_text_btn.dart';
import 'package:skills_pe/sharedWidgets/vertical_separator.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/utility.dart';

class OtpVerification extends StatefulWidget {
  final String mobileNumber;
  const OtpVerification({Key? key, required this.mobileNumber})
      : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String otp = '';
  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = LoginBloc(SendOTPRepository());
    return Scaffold(
        body: BlocConsumer(
      bloc: loginBloc,
      listenWhen: (previous, current) => current != previous,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          buildShowDialog(context);
        } else if (state is VerifyOtpSuccessState) {
          Navigator.of(context).pop();
          if (state.message.isNotEmpty == true) {
            showSnackBar(context, state.message);
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeMain(),
            ),
          );
        } else if (state is VerifyOtpFailureState) {
          if (state.error.isNotEmpty == true) {
            showSnackBar(context, state.error);
          }
          Navigator.of(context).pop();
        }
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
                            "assets/icons/skillspe_logo.svg",
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          const VerticalSeparator(
                            heightFactor: 0.05,
                          ),
                          const GradientTitle(text: VERIFY_PHONE_NUMBER),
                          const VerticalSeparator(heightFactor: 0.1),
                          PinCodeTextField(
                            appContext: context,
                            length: 6,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            onChanged: (String value) {
                              otp = value;
                            },
                            pinTheme: PinTheme(
                                selectedColor:
                                    Theme.of(context).primaryColorDark,
                                errorBorderColor: const Color(0xffD0D1DA),
                                inactiveColor: const Color(0xffD0D1DA),
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
                                if (otp.length == 6) {
                                  loginBloc.add(VerifyOTPEvent(
                                      otp: otp,
                                      mobileNumber: widget.mobileNumber));
                                } else {
                                  showSnackBar(context, OTP_VALIDATION_MESSAGE);
                                }
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
        );
      },
    ));
  }
}
