import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

part 'list_challenges_event.dart';
part 'list_challenges_state.dart';

class ListChallengesBloc
    extends Bloc<ListChallengesEvent, ListChallengesState> {
  final Dio _dio = Dio();

  ListChallengesBloc() : super(ListChallengesInitial());

  @override
  Stream<ListChallengesState> mapEventToState(
      ListChallengesEvent event) async* {
    if (event is InitialFetchEvent) {
      yield* _mapInitialFetchToState();
    }
    // Add more events if needed
  }

  Stream<ListChallengesState> _mapInitialFetchToState() async* {
    yield ListChallengesLoading();

    try {
      // Replace the URL with your actual API endpoint
      final response =
          await _dio.get('https://aristoteles-stg.skillspe.com/v1/challenges');
      print(response);
      if (response.statusCode == 200) {
        final List<dynamic> challengesData = response.data;
        // Convert dynamic list to List<Map<String, dynamic>>
        final List<Map<String, dynamic>> challengesList = challengesData
            .map((dynamic item) => item as Map<String, dynamic>)
            .toList();
        yield ListChallengesLoaded(challengesList);
      } else {
        yield ListChallengesError(
            'Failed to fetch challenges. Status code: ${response.statusCode}');
      }
    } catch (e) {
      yield ListChallengesError('Error: $e');
    }
  }
}
