import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:skills_pe/screens/home_screens/bloc/list_challenges_bloc.dart';
import 'package:skills_pe/screens/home_screens/bloc/list_quizzes_bloc.dart';
import 'package:skills_pe/screens/home_screens/bloc/list_tournaments_bloc.dart';
import 'package:skills_pe/screens/home_screens/repository/list_challenges_repo.dart';
import 'package:skills_pe/screens/home_screens/repository/list_quizzes_repo.dart';
import 'package:skills_pe/screens/home_screens/repository/list_tournaments_repo.dart';

import 'package:skills_pe/screens/home_screens/ui/quiz_widget.dart';
import 'package:skills_pe/screens/home_screens/ui/challenges_widget.dart';
import 'package:skills_pe/screens/home_screens/ui/tournament_widget.dart';

import 'package:skills_pe/screens/home_screens/ui/bottom_navbar.dart';
import 'package:skills_pe/sharedWidgets/skeletonLoaders/box_with_title.dart';
import 'package:skills_pe/sharedWidgets/appBars/noti_wallet_appbar.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMain();
}

class _HomeMain extends State<HomeMain> {
  late ListChallengeBloc _listChallengeBloc;
  late ListQuizzesBloc _listQuizzesBloc;
  late ListTournamentsBloc _listTournamentsBloc;

  @override
  void initState() {
    super.initState();
    _listChallengeBloc = ListChallengeBloc(ListChallengeRepository());
    _listChallengeBloc.add(FetchListChallengeEvent());

    _listQuizzesBloc = ListQuizzesBloc(ListQuizzesRepository());
    _listQuizzesBloc.add(FetchListQuizzesEvent());

    _listTournamentsBloc = ListTournamentsBloc(ListTournamentsRepository());
    _listTournamentsBloc.add(FetchListTournamentsEvent());
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
            BlocBuilder<ListChallengeBloc, ListChallengeState>(
              bloc: _listChallengeBloc,
              builder: (context, state) {
                if (state is ListChallengeLoadingState) {
                  return ShimmerBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 180,
                      showTitleContainer: true);
                } else if (state is ListChallengeSuccessState) {
                  return SingleChildScrollView(
                      child: ChallengesWidget(
                    title: 'Challenges',
                    data: state.challenges,
                  ));
                } else if (state is ListChallengeFailureState) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return const Text('Unexpected state');
                }
              },
            ),
            BlocBuilder<ListQuizzesBloc, ListQuizzesState>(
              bloc: _listQuizzesBloc,
              builder: (context, state) {
                if (state is ListQuizzesLoadingState) {
                  return ShimmerBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 180,
                      showTitleContainer: true);
                } else if (state is ListQuizzesSuccessState) {
                  return SingleChildScrollView(
                      child: QuizWidget(
                    title: 'Quizzes',
                    data: state.quizzes,
                  ));
                } else if (state is ListQuizzesFailureState) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return const Text('Unexpected state');
                }
              },
            ),
            BlocBuilder<ListTournamentsBloc, ListTournamentsState>(
              bloc: _listTournamentsBloc,
              builder: (context, state) {
                if (state is ListTournamentsLoadingState) {
                  return ShimmerBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 180,
                      showTitleContainer: true);
                } else if (state is ListTournamentsSuccessState) {
                  return SingleChildScrollView(
                      child: TournamentWidget(
                    title: 'Tournaments',
                    data: state.tournaments,
                  ));
                } else if (state is ListTournamentsFailureState) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return const Text('Unexpected state');
                }
              },
            ),
            const SizedBox(height: 70),
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
