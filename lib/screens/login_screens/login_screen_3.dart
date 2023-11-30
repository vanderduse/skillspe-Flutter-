import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:skills_pe/screens/home_screens/home_screen_1.dart';

class LoginScreen3 extends StatefulWidget {
  const LoginScreen3({Key? key}) : super(key: key);

  @override
  State<LoginScreen3> createState() => _LoginScreen3State();
}

class _LoginScreen3State extends State<LoginScreen3> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffe4d8fa), Colors.white],
            begin: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            _buildLogoAndTitle(width, height),
            _buildContent(width, height),
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

  Widget _buildContent(double width, double height) {
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
            _buildTitle("Enter your details"),
            _buildTextField("Enter Name*", "name"),
            _buildTextField("Email*", "johndoe@gmail.com"),
            _buildCreateAccountButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, height * 0.03, 0, height * 0.02),
      child: AutoSizeText(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildTextField(String labelText, String hintText) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          width * 0.05, height * 0.01, width * 0.05, height * 0.02),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(
              vertical: width * 0.04, horizontal: height * 0.01),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, height * 0.01, 0, 0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen1()));
        },
        child: const AutoSizeText(
          'Create Account',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
