import 'package:flutter/material.dart';
import 'package:skills_pe/screens/home_screens/model/list_challenges_response.dart';
import 'package:skills_pe/sharedWidgets/back_wallet_appbar.dart';
import 'package:skills_pe/sharedWidgets/filter_buttons.dart';
import 'package:skills_pe/sharedWidgets/challenge_card.dart';
import 'package:dio/dio.dart';

class ViewAllChallenges extends StatefulWidget {
  @override
  _ViewAllChallengesState createState() => _ViewAllChallengesState();
}

class _ViewAllChallengesState extends State<ViewAllChallenges> {
  final String baseUrl = 'https://aristoteles-stg.skillspe.com/v1';
  final String challengesApiEndpoint = '/challenges';

  late Dio dio;
  List<ChallengesListResponse> challenges = [];

  @override
  void initState() {
    super.initState();
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    fetchChallenges();
  }

  Future<void> fetchChallenges() async {
    try {
      final response = await dio.get(challengesApiEndpoint);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('data') &&
            responseData['data'] is List<dynamic>) {
          setState(() {
            challenges = List<ChallengesListResponse>.from(responseData['data']);
          });
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

  @override
  Widget build(BuildContext context) {
    // Dummy wallet amount for demonstration
    double dummyWalletAmount = 100.0;
    // Filter button names
    List<String> filterButtonNames = [
      'All',
      'Live',
      'Request',
      'Upcoming',
      'Completed'
    ];

    return Scaffold(
      appBar: AppbarWithBack(
        screenName: 'Challenges',
        walletAmount: dummyWalletAmount,
      ),
      // Rest of your Scaffold content...
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Filter buttons
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: ButtonGroup(
                buttonNames: filterButtonNames,
                onItemSelected: (index) {
                  // Handle filter button selection here
                  print('Selected filter index: $index');
                },
              ),
            ),

            // Challenge cards - Vertical ListView
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: challenges.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 200, // Set a fixed height or adjust as needed
                  child: ChallengeCard(
                    item: challenges[index],
                    // Add your custom leftBorderColor if needed
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
