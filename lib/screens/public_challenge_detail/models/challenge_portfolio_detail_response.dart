class ChallengePortfolioDetailResponse {
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? gameType;
  String? gameId;
  double? investedAmount;
  double? returnAmount;
  double? returnPercentage;

  ChallengePortfolioDetailResponse(
      {this.createdAt,
      this.updatedAt,
      this.userId,
      this.gameType,
      this.gameId,
      this.investedAmount,
      this.returnAmount,
      this.returnPercentage});

  ChallengePortfolioDetailResponse.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    gameType = json['game_type'];
    gameId = json['game_id'];
    investedAmount = json['invested_amount'];
    returnAmount = json['return_amount'];
    returnPercentage = json['return_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_id'] = userId;
    data['game_type'] = gameType;
    data['game_id'] = gameId;
    data['invested_amount'] = investedAmount;
    data['return_amount'] = returnAmount;
    data['return_percentage'] = returnPercentage;
    return data;
  }
}
