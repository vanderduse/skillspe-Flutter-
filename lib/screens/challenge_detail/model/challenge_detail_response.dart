class ChallengeDetailResponse {
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
  int? prizeAmount;
  String? category;
  String? status;
  String? challengeInfo;
  double? participationFee;

  ChallengeDetailResponse(
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
      this.category,
      this.status,
      this.challengeInfo,
      this.participationFee});

  ChallengeDetailResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    category = json['category'];
    status = json['status'];
    participationFee = json['participation_fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
    data['category'] = category;
    data['status'] = status;
    data['participation_fee'] = participationFee;
    return data;
  }
}
