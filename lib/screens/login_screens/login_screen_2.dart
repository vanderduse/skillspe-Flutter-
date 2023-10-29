import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'login_screen_3.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffe4d8fa), Colors.white],
            begin: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            _buildLogoAndTitle(width, height),
            _buildContent(width, height, context),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoAndTitle(double width, double height) {
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

  Widget _buildContent(double width, double height, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
        height: height * 0.42,
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
          children: <Widget>[
            _buildTitle("Enter OTP"),
            _buildOtpInput(context),
            _buildResendOtpButton(),
            _buildContinueButton(context),
            _buildOtpHint(),
            _buildDisplayNumber(),
            _buildEditMobileButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, height * 0.03, 0, width * 0.12),
      child: AutoSizeText(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildOtpInput(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.fromLTRB(width * 0.12, 0, width * 0.12, height * 0.01),
      child: PinCodeTextField(
        appContext: context,
        length: 4, // Specify the length of the OTP (4 digits)
        onChanged: (String value) {
          // Callback function when OTP changes
          print(value);
        },
        onCompleted: (String value) {
          // Callback function when the user has entered a complete OTP
        },
      ),
    );
  }

  Widget _buildResendOtpButton() {
    return TextButton(
      onPressed: () {},
      child: const AutoSizeText(
        'Resend OTP',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen3(),
          ),
        );
      },
      child: const AutoSizeText(
        'Continue',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildOtpHint() {
    return const SizedBox(
      height: 0,
    );
  }

  Widget _buildDisplayNumber() {
    return TextButton(
      onPressed: () {},
      child: const Text('Edit Mobile Number'),
    );
  }

  Widget _buildEditMobileButton() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          'OTP has been sent to ',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        AutoSizeText(
          '+918010******',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
