import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skills_pe/screens/home_screens/ui/quiz_widget.dart';
import 'package:skills_pe/screens/home_screens/ui/challenges_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:skills_pe/screens/home_screens/ui/bottom_navbar.dart';
import 'package:skills_pe/screens/home_screens/ui/tournament_widget.dart';
import 'package:dio/dio.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMain();
}

class _HomeMain extends State<HomeMain> {
  final String baseUrl = 'https://aristoteles-stg.skillspe.com/v1';
  final String challengesApiEndpoint = '/challenges';
  final String quizApiEndpoint = '/quizzes';
  final String tournamentApiEndpoint = '/tournaments';

  late Dio dio;
  List<Map<String, dynamic>> challengesData = [];
  List<Map<String, dynamic>> quizData = [];
  List<Map<String, dynamic>> tournamentData = [];

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    fetchChallenges();
    fetchQuiz();
    fetchTournaments();
  }

  Future<List<Map<String, dynamic>>> fetchChallenges() async {
    try {
      final response = await dio.get(challengesApiEndpoint);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('data') &&
            responseData['data'] is List<dynamic>) {
          return List<Map<String, dynamic>>.from(responseData['data']);
        } else {
          print('Invalid data format received: $responseData');
          throw Exception('Invalid data format received');
        }
      } else {
        print('Failed to load challenges data: ${response.statusCode}');
        throw Exception(
            'Failed to load challenges data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching challenges data: $error');
      throw Exception('Error fetching challenges data: $error');
    }
  }

  Future<List<Map<String, dynamic>>> fetchQuiz() async {
    try {
      final response = await dio.get(quizApiEndpoint);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('data') &&
            responseData['data'] is List<dynamic>) {
          return List<Map<String, dynamic>>.from(responseData['data']);
        } else {
          print('Invalid data format received: $responseData');
          throw Exception('Invalid data format received');
        }
      } else {
        print('Failed to load QUIZ data: ${response.statusCode}');
        throw Exception('Failed to load QUIZ data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching QUIZ data: $error');
      throw Exception('Error fetching QUIZ data: $error');
    }
  }

  Future<List<Map<String, dynamic>>> fetchTournaments() async {
    try {
      final response = await dio.get(tournamentApiEndpoint);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('data') &&
            responseData['data'] is List<dynamic>) {
          return List<Map<String, dynamic>>.from(responseData['data']);
        } else {
          print('Invalid data format received: $responseData');
          throw Exception('Invalid data format received');
        }
      } else {
        print('Failed to load TOURNAMENT data: ${response.statusCode}');
        throw Exception(
            'Failed to load TOURNAMENT data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching TOURNAMENT data: $error');
      throw Exception('Error fetching TOURNAMENT data: $error');
    }
  }

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
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchChallenges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching data
                } else if (snapshot.hasError) {
                  print('${snapshot.error}');
                  return Text('Error fetching data: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No challenge data available');
                } else {
                  // Render your ChallengesWidget with the fetched data
                  return ChallengesWidget(
                      title: 'Challenges', data: snapshot.data!);
                }
              },
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchQuiz(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching data
                } else if (snapshot.hasError) {
                  print('${snapshot.error}');
                  return Text('Error fetching QUIZ data: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No quiz data available');
                } else {
                  // Render your ChallengesWidget with the fetched data
                  return QuizWidget(title: 'Quiz', data: snapshot.data!);
                }
              },
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchTournaments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading indicator while fetching data
                } else if (snapshot.hasError) {
                  print('${snapshot.error}');
                  return Text(
                      'Error fetching TOURNAMNENT data: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No TOURNAMENT data available');
                } else {
                  // Render your ChallengesWidget with the fetched data
                  return TournamentWidget(
                      title: 'Tournament', data: snapshot.data!);
                }
              },
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
