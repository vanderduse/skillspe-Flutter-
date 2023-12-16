import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skills_pe/screens/home_screens/quiz_card.dart';
import 'package:skills_pe/screens/home_screens/challenges_card.dart';
import 'package:flutter_svg/svg.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMain();
}

class _HomeMain extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationWithWallet("Home", 120.00, showBack: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MySwiper(),
            ChallengesWidget(
              title: 'Challenges',
              data: [
                {
                  'title':
                      'Lorem ipsum dolor sit amet consectetur. GdhEst dolor sit amet consectetur',
                  'icon':
                      'https://cdn-icons-png.flaticon.com/512/1800/1800912.png',
                  'type': 'Motivator',
                  'date': 'Jun 30 - Jul 30, 2023',
                  // Add more properties as needed
                },
                {
                  'title': 'Lorem ipsum dolor sit amet.',
                  'icon':
                      'https://cdn-icons-png.flaticon.com/512/1800/1800912.png',
                  'type': 'Inspiration',
                  'date': 'Jun 30 - Jul 30, 2023',
                  // Add more properties as needed
                },
                {
                  'title': 'Lorem ipsum dolor sit amet consectetur.',
                  'icon':
                      'https://cdn-icons-png.flaticon.com/512/1800/1800912.png',
                  'type': 'Inspiration',
                  'date': 'Jun 30 - Jul 30, 2023',
                  // Add more properties as needed
                },
                // Add more data items as needed
              ],
            ),
            // Other widgets...
          ],
        ),
      ),
    );
  }
}

class MySwiper extends StatelessWidget {
  const MySwiper(); // Add 'const' to the constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 20.0, bottom: 20.0), // Add top and bottom margins
      height: 200, // Set a fixed height for Swiper container
      child: CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 213, 213, 213),
                  borderRadius:
                      BorderRadius.circular(20.0), // Adjust the radius
                  boxShadow: const [
                    // BoxShadow(
                    //   color: Color.fromARGB(255, 233, 211, 249),
                    //   spreadRadius: 3,
                    //   blurRadius: 7,
                    //   offset: Offset(0, 3), // changes position of shadow
                    // ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Image from backend $i',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

AppBar navigationWithWallet(
  String screenName,
  double walletAmount, {
  bool showBack = true,
}) {
  return AppBar(
    centerTitle: false,
    automaticallyImplyLeading: false,
    shape: const Border(
      bottom: BorderSide(
        color: Color.fromRGBO(0, 0, 0, 0.10),
        width: 1,
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (showBack) // Conditionally show back icon based on showBack value
          Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/arrow-left.svg",
              height: 20,
              width: 20,
            ),
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            screenName,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    ),
    actions: [WalletIcon(walletAmount: walletAmount)],
  );
}

class WalletIcon extends StatelessWidget {
  final double walletAmount;

  const WalletIcon({
    Key? key,
    required this.walletAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: const Color(0xffFDF0CE),
            borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          child: Row(
            children: [
              Container(
                child: SvgPicture.asset(
                  "assets/icons/wallet.svg",
                  height: 20,
                  width: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 4),
                child: Text(
                  walletAmount.toStringAsFixed(1),
                  style: const TextStyle(
                      color: Color(0xff181201), fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ));
  }
}
