import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

// Define the User class
class User {
  final String imgURL;
  final String name;

  User(this.imgURL, this.name);
}

class InviteChallengersBottomSheet extends StatefulWidget {
  const InviteChallengersBottomSheet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InviteChallengersBottomSheetState();
}

class _InviteChallengersBottomSheetState
    extends State<InviteChallengersBottomSheet> {
  // List of users (to be removed after API integration)
  List<User> userList = [
    User(
        'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?s=1024x1024&w=is&k=20&c=tq1C4HoZraH5szwBZqUf7sGVp7EPO-VB8PVbAPjagqY=',
        'Shubham'),
    User(
        'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?s=1024x1024&w=is&k=20&c=tq1C4HoZraH5szwBZqUf7sGVp7EPO-VB8PVbAPjagqY=',
        'John'),
  ];

  // Map to track checked users
  Map<String, bool> checkedUsers = {};

  // Variable to track if any user is checked
  bool isAnyUserChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Top header
            Container(
              width: MediaQuery.of(context).size.width,
              height: 0.1,
              color: Colors.black,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/cup.svg',
                        height: 26,
                        width: 26,
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Invite Challengers',
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(40, 0, 0, 0),
              thickness: 1,
              height: 10,
            ),

            // Search field
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: SEARCH_YOUR_FRIEND,
                  contentPadding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),

            // List of users
            Expanded(
              child: ListView.builder(
                itemCount: userList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(userList[index].imgURL),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(userList[index].name),
                    trailing: Checkbox(
                      value: checkedUsers[userList[index].name] ?? false,
                      onChanged: (bool? value) {
                        setState(() {
                          checkedUsers[userList[index].name] = value ?? false;
                          isAnyUserChecked = checkedUsers.containsValue(true);
                        });
                      },
                      shape: const CircleBorder(),
                    ),
                  );
                },
              ),
            ),

            // Divider
            const Divider(),

            // '+ Invite' button
            Visibility(
              visible: isAnyUserChecked,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
                child: FilledBtn(
                  textColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () {},
                  label: '+ Invite',
                ),
              ),
            ),

            // Bottom row of buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBottomButton(
                    iconPath: 'assets/icons/link.svg',
                    onPressed: () {
                      _copyToClipboardAndHapticFeedback("Challenge Copied!");
                    },
                  ),
                  _buildBottomButton(
                    iconPath: 'assets/icons/qr-code.svg',
                    onPressed: () {
                      _showQRCodeBottomSheet(context);
                    },
                  ),
                  _buildBottomButton(
                    iconPath: 'assets/icons/whatsapp.svg',
                    onPressed: () {
                      _launchWhatsApp("Testing whatsapp challenge sharing!");
                    },
                  ),
                  _buildBottomButton(
                    iconPath: 'assets/icons/sms.svg',
                    onPressed: () {
                      _sendSMS("Challenge Copied!");
                    },
                  ),
                  _buildBottomButton(
                    iconPath: 'assets/icons/menu.svg',
                    onPressed: () {
                      _shareContent("challenge copied");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build bottom buttons
  Widget _buildBottomButton(
      {required String iconPath, required void Function() onPressed}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 237, 247),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(iconPath),
      ),
    );
  }
}

// Method to copy text to clipboard and provide haptic feedback
void _copyToClipboardAndHapticFeedback(String text) {
  String challengeMessage = '''
[Link to the challenge]
''';
  Clipboard.setData(ClipboardData(text: challengeMessage));
  HapticFeedback.heavyImpact();
}

// Method to launch WhatsApp with predefined message
void _launchWhatsApp(String text) async {
  String challengeMessage = '''
Hey, come join the challenge on SkillsPe now!
🚀 Convert your skills into wealth 🚀

Click on the link below to join:
[Link to the challenge]
''';
  String url = "https://wa.me/?text=$challengeMessage";
  launchUrl(
    Uri.parse(url),
  );
  HapticFeedback.heavyImpact();
}

// Method to send SMS with predefined message
void _sendSMS(String text) async {
  String message = '''
Hey, come join the challenge on SkillsPe now! 
      
Click on the link below to join: [Link to the challenge]''';

  String url = 'sms:?body=$message';
  launchUrl(
    Uri.parse(url),
  );
  HapticFeedback.heavyImpact();
}

// Method to share content with pre-defined text
void _shareContent(String text) {
  String message = '''
Hey, come join the challenge on SkillsPe now!

Click on the link below to join: 
[Link to the challenge]
''';
  Share.share(message);
  HapticFeedback.heavyImpact();
}

// Method to build the bottom sheet
void _showQRCodeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Text(
              'QR Code',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Horizontal line
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            SizedBox(height: 8),
            // QR Code
            // QrImage(
            //   data: 'Your QR code data here',
            //   version: QrVersions.auto,
            //   size: 200,
            // ),
          ],
        ),
      );
    },
  );
}
