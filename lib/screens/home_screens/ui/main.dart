import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/home_screens/bloc/home_screen_bloc.dart';
import 'package:skills_pe/screens/home_screens/repository/home_screen_repository.dart';
import 'package:skills_pe/screens/home_screens/ui/widgets/quiz_widget.dart';
import 'package:skills_pe/screens/home_screens/ui/widgets/challenges_widget.dart';
import 'package:skills_pe/screens/home_screens/ui/widgets/campaigns_widget.dart';
import 'package:skills_pe/screens/home_screens/ui/widgets/public_challenges_widget.dart';
import 'package:skills_pe/screens/home_screens/ui/widgets/bottom_navbar.dart';
import 'package:skills_pe/screens/home_screens/ui/widgets/home_swipper.dart';
import 'package:skills_pe/sharedWidgets/appBars/noti_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/skeletonLoaders/challenge_card_skeleton.dart';
import 'package:skills_pe/sharedWidgets/skeletonLoaders/quiz_card_skeleton.dart';
import 'package:skills_pe/utility/constants.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMain();
}

class _HomeMain extends State<HomeMain> {
  late HomeScreenBloc _homeScreenPublicChallengesBloc;
  late HomeScreenBloc _homeScreenPrivateChallengesBloc;
  late HomeScreenBloc _homeScreenQuizBloc;
  late HomeScreenBloc _homeScreenChampaignBloc;
  //late HomeScreenBloc _homeScreenTournamentBloc;

  @override
  void initState() {
    super.initState();
    HomeScreenRepository homeScreenRepository = HomeScreenRepository();

    _homeScreenPublicChallengesBloc = HomeScreenBloc(homeScreenRepository);
    _homeScreenPublicChallengesBloc
        .add(HomeScreenFetchChallengesEvent(isPublic: true));

    _homeScreenPrivateChallengesBloc = HomeScreenBloc(homeScreenRepository);
    _homeScreenPrivateChallengesBloc
        .add(HomeScreenFetchChallengesEvent(isPublic: false));

    _homeScreenQuizBloc = HomeScreenBloc(homeScreenRepository);
    _homeScreenQuizBloc.add(HomeScreenFetchQuizEvent());

    _homeScreenChampaignBloc = HomeScreenBloc(homeScreenRepository);
    _homeScreenChampaignBloc.add(HomeScreenFetchChampaignsEvent());
  }

  final List<String> imageUrls = [
    'https://res.cloudinary.com/dkxdyhmij/image/upload/v1702836936/dev/file_gqtuxt.png',
    'https://res.cloudinary.com/dkxdyhmij/image/upload/v1702836936/dev/file_gqtuxt.png',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationWithWallet(HOME, 120.00, showBack: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeSwipper(imageUrls: imageUrls),
            BlocBuilder<HomeScreenBloc, HomeScreenState>(
              bloc: _homeScreenPrivateChallengesBloc,
              builder: (context, state) {
                if (state is HomeScreenChallengeLoadingState) {
                  return const ChallengeCardSkeleton();
                } else if (state is HomeScreenChallengeSuccessState) {
                  return SingleChildScrollView(
                      child: ChallengesWidget(
                    title: PRIVATE_CHALLENGE_TITLE,
                    subTitle: PRIVATE_CHALLENGE_SUBTITLE,
                    data: state.challenges,
                  ));
                } else if (state is HomeScreenChallengeFailureState) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return const Text('Unexpected state');
                }
              },
            ),
            BlocBuilder<HomeScreenBloc, HomeScreenState>(
              bloc: _homeScreenPublicChallengesBloc,
              builder: (context, state) {
                if (state is HomeScreenChallengeLoadingState) {
                  return const ChallengeCardSkeleton();
                } else if (state is HomeScreenChallengeSuccessState) {
                  return SingleChildScrollView(
                      child: PublicChallengesWidget(
                    title: PUBLIC_CHALLENGE_TITLE,
                    subTitle: PUBLIC_CHALLENGE_SUBTITLE,
                    data: state.challenges,
                  ));
                } else if (state is HomeScreenChallengeFailureState) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return const Text('Unexpected state');
                }
              },
            ),
            BlocBuilder<HomeScreenBloc, HomeScreenState>(
              bloc: _homeScreenChampaignBloc,
              builder: (context, state) {
                if (state is HomeScreenChampaignLoadingState) {
                  return const ChallengeCardSkeleton();
                } else if (state is HomeScreenChampaignSuccessState) {
                  return SingleChildScrollView(
                      child: CampaignsWidget(
                    data: state.champaigns,
                  ));
                } else if (state is HomeScreenChampaignFailureState) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return const Text('Unexpected state');
                }
              },
            ),

            BlocBuilder<HomeScreenBloc, HomeScreenState>(
              bloc: _homeScreenQuizBloc,
              builder: (context, state) {
                if (state is HomeScreenQuizLoadingState) {
                  return const QuizCardSkeleton();
                } else if (state is HomeScreenQuizSuccessState) {
                  return SingleChildScrollView(
                      child: QuizWidget(
                    title: QUIZ_TITLE,
                    subTitle: QUIZ_SUBTITLE,
                    data: state.quizzes,
                  ));
                } else if (state is HomeScreenQuizFailureState) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return const Text('Unexpected state');
                }
              },
            ),
            //THIS IS TOURNAMENT CODE WILL BE USED LATER
            // BlocBuilder<HomeScreenBloc, HomeScreenState>(
            //   bloc: _homeScreenTournamentBloc,
            //   builder: (context, state) {
            //     if (state is HomeScreenTournamentsLoadingState) {
            //       return ShimmerBox(
            //           width: MediaQuery.of(context).size.width * 0.9,
            //           height: 180,
            //           showTitleContainer: true);
            //     } else if (state is HomeScreenTournamentsSuccessState) {
            //       return SingleChildScrollView(
            //           child: TournamentWidget(
            //         title: 'Tournaments',
            //         data: state.tournaments,
            //       ));
            //     } else if (state is HomeScreenTournamentsFailureState) {
            //       return Text('Error: ${state.errorMessage}');
            //     } else {
            //       return const Text('Unexpected state');
            //     }
            //   },
            // ),
            const SizedBox(height: 70),
          ],
        ),
      ),
      floatingActionButton: const BottomNavigationBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
