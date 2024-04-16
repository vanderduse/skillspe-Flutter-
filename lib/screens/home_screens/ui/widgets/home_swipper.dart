import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:skills_pe/screens/home_screens/model/list_banners_response.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSwipper extends StatefulWidget {
  final List<BannersListResponse> bannerList;
  const HomeSwipper({Key? key, required this.bannerList}) : super(key: key);

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
                  setState(() => _currentIndex = index),
            ),
            items: widget.bannerList.map((banner) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      _handleBannerTap(banner.target);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(banner.bannerImg ??
                              "https://res.cloudinary.com/dkxdyhmij/image/upload/v1702836936/dev/file_gqtuxt.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Positioned(
            bottom: 10.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: DotsIndicator(
                dotsCount: widget.bannerList.length,
                position: _currentIndex,
                decorator: DotsDecorator(
                  color: const Color.fromARGB(156, 234, 234, 234),
                  activeColor: const Color.fromARGB(255, 255, 255, 255),
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

  void _handleBannerTap(String? target) async {
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
}
