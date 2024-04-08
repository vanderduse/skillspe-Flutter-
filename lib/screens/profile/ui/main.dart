import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    'Personal Details',
    'Wallet',
    'My Activity',
    'KYC',
    'Terms & Conditions',
    'Support'
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
        child: Column(
          children: profileOptions
              .map((option) => ProfileOptionCard(title: option))
              .toList(),
        ),
      ),
      floatingActionButton: const BottomNavigationBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ProfileOptionCard extends StatelessWidget {
  final String title;

  const ProfileOptionCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        // Add onTap functionality if required
      ),
    );
  }
}
