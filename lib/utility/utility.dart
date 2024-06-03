import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}

showSnackBar(BuildContext context, String message) {
  var snackBar = SnackBar(
      content: Text(
    message,
  ));
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showProgressDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false, // Dialog will not close when tapping outside
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(message),
            ],
          ),
        ),
      );
    },
  );
}

void redirectURL(String? target) async {
  if (target != null) {
    if (Uri.parse(target).isAbsolute) {
      // If it's a URL, launch the browser
      launchUrl(
        Uri.parse(target),
      );
    } else {
      // If it's a screen name, navigate to that screen
      // Example: Replace the Navigator code with your navigation logic
      launchUrl(
        Uri.parse('skills_pe://PrivateChallengeList'),
      );
    }
  }
}

void navigate(BuildContext context, Widget screenName) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screenName,
    ),
  );
}

void navigateWithReplacement(BuildContext context, Widget screenName) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => screenName,
    ),
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String? hexColor) {
    try {
      hexColor = hexColor?.toUpperCase().replaceAll("#", "");
      if (hexColor?.length == 6) {
        hexColor = "FF$hexColor";
      }
      return int.parse(hexColor!, radix: 16);
    } catch (e) {
      return 0;
    }
  }

  HexColor(final String? hexColor) : super(_getColorFromHex(hexColor));
}
