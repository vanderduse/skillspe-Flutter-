import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/screens/home_screens/quiz_card.dart';
import 'package:skills_pe/utility/constants.dart';
import '../../bloc/challenges_bloc.dart';
import '../../bloc/quiz_bloc.dart';
import '../../models/quiz_model.dart';
import '../create_challenge/ui/create_challenge_screen.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final PageController _pageController = PageController();
  static const int _totalItems = 3; // Total number of banner items
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _currentPage = (_currentPage + 1) % _totalItems;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCirc,
        );
      }
    });
  }

  final QuizBloc quizBloc = QuizBloc();
  @override
  void dispose() {
    _pageController.dispose();
    quizBloc.dispose(); // Close the QuizBlo
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Home'),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, width * 0.03, 0),
                padding: EdgeInsets.symmetric(
                    horizontal: height * 0.01, vertical: width * 0.01),
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  children: [
                    Icon(Icons.account_balance_wallet_outlined),
                    Text('120\$')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, width * 0.05, 0),
                child: const Icon(Icons.notifications),
              )
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xffe4d8fa),
                  Colors.white,
                ],
                begin: Alignment.bottomCenter,
              )),
              child: Column(
                children: [
                  BannerContainer(
                    pageController: _pageController,
                    currentPage: _currentPage,
                  ),
                  DotsIndicator(
                    dotsCount: _totalItems,
                    position: _currentPage.toDouble().toInt(),
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: Colors.purple,
                      size: const Size(5, 5),
                      activeSize: const Size(8, 8),
                      shape: const Border(),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => ChallengeBloc()
                      ..fetchChallenges(), // Create BLoC and fetch data
                    child: const Challenges(),
                  ),
                  const Quizz(),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 100,
              left: 80,
              right: 80,
              height: 50,
              child: Container(
                height: 50,
                width: 70,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset('assets/images/home.svg'),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 8, top: 4, right: 0, bottom: 4),
                        child: SpeedDial(
                          direction: SpeedDialDirection.up,
                          icon: Icons.add,
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          activeIcon: Icons.close,
                          visible: true,
                          curve: Curves.bounceInOut,
                          elevation: 8.0,
                          overlayOpacity: 0.4,
                          childrenButtonSize: const Size(180, 55),
                          spacing: 3,
                          children: [
                            SpeedDialChild(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset('assets/images/flag.svg'),
                                    const Text(CREATETOURNAMENT,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Inter",
                                            color:
                                                Color.fromRGBO(70, 43, 156, 1)))
                                  ],
                                ),
                              ),
                              backgroundColor: Colors.white,
                              onTap: () => {},
                            ),
                            SpeedDialChild(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset('assets/images/cup.svg'),
                                    const Text(CREATECHALLENGE,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Inter",
                                            color:
                                                Color.fromRGBO(70, 43, 156, 1)))
                                  ],
                                ),
                              ),
                              backgroundColor: Colors.white,
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateChallengeScreen()))
                              },
                            ),
                          ],
                        )),
                    SvgPicture.asset('assets/images/profile_circle.svg')
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class BannerContainer extends StatelessWidget {
  final PageController pageController;
  late final int currentPage;

  BannerContainer(
      {super.key, required this.pageController, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin:
          const EdgeInsets.all(16), // Use constants here for consistent spacing
      height: height * 0.21,
      width: width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff2E1452),
            Color(0xff862A9C),
            Color(0xff773EAD),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage('assets/images/banner_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (int page) {
                currentPage = page;
              },
              children: const [
                BannerItem(
                  imagePath: 'assets/images/athlete_banner.png',
                  text: ' Create your \n own challenge \n with SkillsPe',
                ),
                BannerItem(
                  imagePath: 'assets/images/athlete_banner.png',
                  text: 'Banner 2 Text',
                ),
                BannerItem(
                  imagePath: 'assets/images/athlete_banner.png',
                  text: 'Banner 3 Text',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateChallengeScreen()));
              },
              child: const Text('Create Now'),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerItem extends StatelessWidget {
  final String imagePath;
  final String text;

  const BannerItem({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
          child: Image.asset(imagePath),
        ),
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Challenges extends StatefulWidget {
  const Challenges({super.key});

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  final List<ChallengeItem> challenges = []; // Initialize with an empty list

  late ChallengeBloc _challengesBloc;

  @override
  void initState() {
    super.initState();
    _challengesBloc = ChallengeBloc();
    _challengesBloc.fetchChallenges();
  }

  @override
  Widget build(BuildContext context) {
    return /*BlocProvider(
      create: (context) => ChallengeBloc(),
      child: BlocBuilder<ChallengeBloc, List<ChallengeItem>>(
        builder: (context, challenges) {
          return SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: challenges.length,
              itemBuilder: (context, index) {
                final challenge = challenges[index];
                return SizedBox(width: 300, child: ChallengeCard(challengeItem: challenge));
              },
            ),
          );
        },
      ),
    );*/

        /*  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Challenges',
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('View All'),
            )
          ],
        ),*/
        /*Column(
          children: [

            Container(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: challenges.length,
                itemBuilder: (context, index) {
                  final challenge = challenges[index];
                  return SizedBox(width: 300 ,child: ChallengeItemWidget(challengeItem: challenge));
                },
              ),
            ),
            Container(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: challenges.length,
                itemBuilder: (context, index) {
                  final challenge = challenges[index];
                  return SizedBox(
                    width: 300,
                    child: ChallengeItemWidget(
                    challengeItem: challenge,


                    ),
                  );
                },
              ),
            ),
             */ /*Container(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: challenges.length,
                itemBuilder: (context, index) {
                  final challenge = challenges[index];
                  return ChallengeItemWidget(challengeItem: challenge);
                },
              ),
            ),*/ /*
          ],
        ),
      ],
    );*/
        Container();
  }
}

class ChallengeItem {
  final String title;
  final String date;
  final String description;

  ChallengeItem(
      {required this.title, required this.date, required this.description});
}

class Quizz extends StatefulWidget {
  const Quizz({super.key});

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  final QuizBloc quizBloc = QuizBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Quiz>>(
      stream: quizBloc.quizStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Quiz> quizList = snapshot.data!.cast<Quiz>();
          debugPrint('QuizCard widget tree: ${quizList.length} items');
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Quiz'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View All'),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 220,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i = 0; i < quizList.length && i < 4; i++)
                                SizedBox(
                                    width: 400,
                                    child: QuizCard(quiz: quizList[i])),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              //for (final quiz in quizList)
                              for (var i = 4; i < quizList.length && i < 8; i++)
                                SizedBox(
                                    width: 400,
                                    child: QuizCard(quiz: quizList[i])),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              /*Column(
                  children: [
                    for (final quiz in quizList)
                    QuizCard(quiz: quiz),
                  ],
                )*/
            ],
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
