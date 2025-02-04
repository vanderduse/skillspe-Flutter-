part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState {}

// Fetch Challenges States
class HomeScreenChallengeLoadingState extends HomeScreenState {}

class HomeScreenPrivateChallengeSuccessState extends HomeScreenState {
  final List<PrivateChallengesListResponse> challenges;
  HomeScreenPrivateChallengeSuccessState(this.challenges);
}

class HomeScreenPrivateChallengeFailureState extends HomeScreenState {
  final String errorMessage;
  HomeScreenPrivateChallengeFailureState(this.errorMessage);
}

// Fetch Public Challenges States
class HomeScreenPublicChallengeLoadingState extends HomeScreenState {}

class HomeScreenPublicChallengeSuccessState extends HomeScreenState {
  final List<PublicChallengesItemResponse> challenges;
  HomeScreenPublicChallengeSuccessState(this.challenges);
}

class HomeScreenPublicChallengeFailureState extends HomeScreenState {
  final String errorMessage;
  HomeScreenPublicChallengeFailureState(this.errorMessage);
}

// Fetch Quiz List State
class HomeScreenQuizLoadingState extends HomeScreenState {}

class HomeScreenQuizSuccessState extends HomeScreenState {
  final List<QuizzesListResponse> quizzes;
  HomeScreenQuizSuccessState(this.quizzes);
}

class HomeScreenQuizFailureState extends HomeScreenState {
  final String errorMessage;
  HomeScreenQuizFailureState(this.errorMessage);
}

// Fetch Tournament List State

class HomeScreenTournamentsLoadingState extends HomeScreenState {}

class HomeScreenTournamentsSuccessState extends HomeScreenState {
  final List<TournamentsListResponse> tournaments;
  HomeScreenTournamentsSuccessState(this.tournaments);
}

class HomeScreenTournamentsFailureState extends HomeScreenState {
  final String errorMessage;
  HomeScreenTournamentsFailureState(this.errorMessage);
}

// Fetch Champaign States

class HomeScreenChampaignLoadingState extends HomeScreenState {}

class HomeScreenChampaignSuccessState extends HomeScreenState {
  final List<CampaignListResponse> champaigns;
  HomeScreenChampaignSuccessState(this.champaigns);
}

class HomeScreenChampaignFailureState extends HomeScreenState {
  final String errorMessage;
  HomeScreenChampaignFailureState(this.errorMessage);
}

// Fetch Banners

class HomeScreenBannerLoadingState extends HomeScreenState {}

class HomeScreenBannerSuccessState extends HomeScreenState {
  final List<BannersListResponse> bannersList;
  HomeScreenBannerSuccessState(this.bannersList);
}

class HomeScreenBannerFailureState extends HomeScreenState {
  final String errorMessage;
  HomeScreenBannerFailureState(this.errorMessage);
}
