import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skills_pe/screens/home_screens/ui/quiz_widget.dart';
import 'package:skills_pe/screens/home_screens/ui/challenges_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:skills_pe/screens/home_screens/ui/bottom_navbar.dart';
import 'package:skills_pe/screens/home_screens/ui/tournament_widget.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMain();
}

class _HomeMain extends State<HomeMain> {
  final List<String> imageUrls = [
    'https://res.cloudinary.com/dkxdyhmij/image/upload/v1702836936/dev/file_gqtuxt.png',
    'https://res.cloudinary.com/dkxdyhmij/image/upload/v1702836936/dev/file_gqtuxt.png',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationWithWallet("Home", 120.00, showBack: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeSwipper(imageUrls: imageUrls),
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
                  'title': 'Lorem ipsum ',
                  'icon':
                      'https://cdn-icons-png.flaticon.com/512/1800/1800912.png',
                  'type': 'Inspiration',
                  'date': 'Jun 30 - Jul 30, 2023',
                  // Add more properties as needed
                },
                // Add more data items as needed
              ],
            ),
            QuizWidget(
              title: 'Quiz',
              data: [
                {
                  'title':
                      'Lorem ipsum dolor sit amet consectetur. GdhEst dolor sit amet consectetur',
                  'icon':
                      'https://cdn-icons-png.flaticon.com/512/4999/4999578.png',
                  'participants': '100+ participants',
                  'date': 'Starts on 01 Oct 23',
                  'price': '₹50'
                  // Add more properties as needed
                },
                {
                  'title': 'Lorem ipsum dolor sit amet consectetur.',
                  'icon':
                      'https://cdn-icons-png.flaticon.com/512/4999/4999578.png',
                  'participants': '100+ participants',
                  'date': 'Starts on 01 Oct 23',
                  'price': '₹20'
                  // Add more properties as needed
                },
                {
                  'title': 'Lorem ipsum dolor.',
                  'icon':
                      'https://cdn-icons-png.flaticon.com/512/4999/4999578.png',
                  'participants': '100+ participants',
                  'date': 'Starts on 01 Oct 23',
                  'price': '₹50'
                  // Add more properties as needed
                },
                // Add more data items as needed
              ],
            ),
            TournamentWidget(
              title: 'Tournaments',
              data: [
                {
                  'title':
                      'Tournament Name',
                  'image':
                      'https://static.vecteezy.com/system/resources/previews/001/988/091/non_2x/cricket-championship-tournament-free-vector.jpg',
                  'type': 'Motivator',
                  'date': 'Jun 30 - Jul 30, 2023',
                  // Add more properties as needed
                },
                {
                  'title': 'Tournament Name',
                  'image':
                      'https://static.vecteezy.com/system/resources/previews/001/988/091/non_2x/cricket-championship-tournament-free-vector.jpg',
                  'type': 'Inspiration',
                  'date': 'Jun 30 - Jul 30, 2023',
                  // Add more properties as needed
                },
               
                // Add more data items as needed
              ],
            ),
             SizedBox(height: 70),
          ],
        ),
      ),
      floatingActionButton: BottomNavigationBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomeSwipper extends StatefulWidget {
  final List<String> imageUrls;

  const HomeSwipper({required this.imageUrls});

  @override
  _HomeSwipperState createState() => _HomeSwipperState();
}

class _HomeSwipperState extends State<HomeSwipper> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 200,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) =>
                  setState(() => _currentIndex = index), // Track current index
            ),
            items: widget.imageUrls // Access imageUrls via widget property
                .map((imageUrl) => Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  NetworkImage(imageUrl), // Load image from URL
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        );
                      },
                    ))
                .toList(),
          ),
          Positioned(
            bottom: 10.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: DotsIndicator(
                dotsCount:
                    widget.imageUrls.length, // Adjust based on image list
                position: _currentIndex, // Use current index for active dot
                decorator: DotsDecorator(
                  color: Color.fromARGB(
                      156, 234, 234, 234), // Use hex code with opacity (255)
                  activeColor: Color.fromARGB(255, 255, 255, 255),
                  size: const Size(8.0, 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
          ),
        ],
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
