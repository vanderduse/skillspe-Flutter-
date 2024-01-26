class ChallengesListResponse {
  String? id;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;
  String? challengeEmoji;
  bool? isPublic;
  String? startTime;
  String? endTime;
  String? prizeAmount;
  String? category;
  String? status;
  double? participationFee;

  ChallengesListResponse({
    required this.id,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.description,
    required this.challengeEmoji,
    required this.isPublic,
    required this.startTime,
    required this.endTime,
    required this.prizeAmount,
    required this.category,
    required this.status,
    required this.participationFee,
  });

  factory ChallengesListResponse.fromJson(Map<String, dynamic> json) {
    return ChallengesListResponse(
      id: json['_id'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      title: json['title'],
      description: json['description'],
      challengeEmoji: json['challenge_emoji'],
      isPublic: json['public'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      prizeAmount: json['prize_amount'],
      category: json['category'],
      status: json['status'],
      participationFee: json['participation_fee'],
    );
  }
}
