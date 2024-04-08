import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/screens/home_screens/ui/widgets/bottom_navbar.dart';
import 'package:skills_pe/sharedWidgets/appBars/noti_wallet_appbar.dart';
import 'package:skills_pe/utility/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  List<String> profileOptions = [
    PERSONAL_DETAILS,
    WALLET,
    MY_ACTIVITY,
    KYC,
    TERMS_AND_CONDITIONS,
    SUPPORT
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationWithWallet(PROFILE, 120.00, showBack: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 22.0),
          child: Column(
            children: profileOptions
                .map((option) => ProfileOptionCard(title: option))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: const BottomNavigationBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ProfileOptionCard extends StatelessWidget {
  final String title;

  static final Map<String, String> iconPaths = {
    WALLET: 'assets/icons/wallet-purple.svg',
    MY_ACTIVITY: 'assets/icons/health.svg',
    KYC: 'assets/icons/ID-card.svg',
    TERMS_AND_CONDITIONS: 'assets/icons/document-text.svg',
    SUPPORT: 'assets/icons/support.svg',
  };

  const ProfileOptionCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String iconPath = iconPaths[title] ?? '';

    // Checking if the title is 'Profile Details'
    if (title == PERSONAL_DETAILS) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/free-photo/close-up-portrait-young-man-isolated-black-studio-background-photoshot-real-emotions-male-model-smiling-feeling-happy-facial-expression-pure-clear-human-emotions-concept_155003-30751.jpg?w=740&t=st=1712609866~exp=1712610466~hmac=5891318219e2e8359ca7cbf4932f60ccb96c1880c4e53129ffc9dc000a36d782'), // URL of the profile picture
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 18),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Suresh Kumar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'sureshk733@gmail.com',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/arrow-right.svg',
                height: 24,
                width: 24,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 16),
              SvgPicture.asset(
                'assets/icons/arrow-right.svg',
                height: 24,
                width: 24,
              ),
            ],
          ),
        ),
      );
    }
  }
}
