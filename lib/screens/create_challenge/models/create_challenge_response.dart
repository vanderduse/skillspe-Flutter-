class CreateChallengeResponse {
  String? id;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;
  String? challengeEmoji;
  bool? public;
  String? startTime;
  String? endTime;
  double? prizeAmount;
  String? results;
  String? category;
  String? status;
  String? challengeInfo;
  double? participationFee;

  CreateChallengeResponse(
      {this.id,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.description,
      this.challengeEmoji,
      this.public,
      this.startTime,
      this.endTime,
      this.prizeAmount,
      this.results,
      this.category,
      this.status,
      this.challengeInfo,
      this.participationFee});

  CreateChallengeResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    description = json['description'];
    challengeEmoji = json['challenge_emoji'];
    public = json['public'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    prizeAmount = json['prize_amount'];
    results = json['results'];
    category = json['category'];
    status = json['status'];
    challengeInfo = json['challenge_info'];
    participationFee = json['participation_fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    data['description'] = description;
    data['challenge_emoji'] = challengeEmoji;
    data['public'] = public;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['prize_amount'] = prizeAmount;
    data['results'] = results;
    data['category'] = category;
    data['status'] = status;
    data['challenge_info'] = challengeInfo;
    data['participation_fee'] = participationFee;
    return data;
  }
}
