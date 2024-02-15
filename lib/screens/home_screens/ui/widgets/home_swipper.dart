import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomeSwipper extends StatefulWidget {
  final List<String> imageUrls;

  const HomeSwipper({super.key, required this.imageUrls});

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
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
                  color: const Color.fromARGB(
                      156, 234, 234, 234), // Use hex code with opacity (255)
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
}
