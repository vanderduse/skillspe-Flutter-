import 'package:flutter/material.dart';
import 'package:skills_pe/screens/challenge_detail/model/challenge_detail_response.dart';
import 'package:skills_pe/screens/home_screens/model/list_private_challenges_response.dart';
import 'package:skills_pe/sharedWidgets/cards/live_challenge_card.dart';
import 'package:skills_pe/sharedWidgets/cards/draft_challenge_card.dart';
import 'package:skills_pe/sharedWidgets/cards/result_pending_challenge_card.dart';
import 'package:skills_pe/sharedWidgets/cards/completed_challenge_card.dart';

abstract class ChallengeCard extends StatelessWidget {
  final PrivateChallengesListResponse item;
  const ChallengeCard({Key? key, required this.item}) : super(key: key);
}

abstract class ChallengeCardFactory {
  ChallengeCard createChallengeCard(PrivateChallengesListResponse item);

  static ChallengeCardFactory getChallengeCardFactory(String status) {
    switch (status) {
      case "DRAFT":
        return DraftChallengeCardFactory();
      case "LIVE":
        return LiveChallengeCardFactory();
      case "RESULTS_PENDING":
        return ResultPendingChallengeCardFactory();
      case "COMPLETED":
        return CompletedChallengeCardFactory();
      // Add cases for other statuses as needed
      default:
        throw Exception("Unknown status: $status");
    }
  }
}

class LiveChallengeCardFactory implements ChallengeCardFactory {
  @override
  ChallengeCard createChallengeCard(PrivateChallengesListResponse item) {
    return LiveChallengeCard(item: item);
  }
}

class DraftChallengeCardFactory implements ChallengeCardFactory {
  @override
  ChallengeCard createChallengeCard(PrivateChallengesListResponse item) {
    return DraftChallengeCard(item: item);
  }
}

class ResultPendingChallengeCardFactory implements ChallengeCardFactory {
  @override
  ChallengeCard createChallengeCard(PrivateChallengesListResponse item) {
    return ResultPendingChallengeCard(item: item);
  }
}

class CompletedChallengeCardFactory implements ChallengeCardFactory {
  @override
  ChallengeCard createChallengeCard(PrivateChallengesListResponse item) {
    return CompletedChallengeCard(item: item);
  }
}
