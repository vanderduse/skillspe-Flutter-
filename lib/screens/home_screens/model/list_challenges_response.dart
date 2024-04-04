// ignore_for_file: unnecessary_this

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
  String startTime;
  String endTime;
  double? prizeAmount;
  String? category;
  String? status;
  double? participationFee;
  ParticipationDetails? participationDetails;

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
    this.participationDetails,
  });

  factory ChallengesListResponse.fromJson(Map<String, dynamic> json) {
    return ChallengesListResponse(
        id: json['id'],
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
        prizeAmount: json['prize_amount']?.toDouble(),
        category: json['category'],
        status: json['status'],
        participationFee: json['participation_fee'],
        participationDetails: json['participation_details'] != null
            ? ParticipationDetails.fromJson(json['participation_details'])
            : null);
  }
}

class ParticipationDetails {
  String? id;
  String? userId;
  String? challengeId;
  String? type;
  String? status;

  ParticipationDetails(
      {this.id, this.userId, this.challengeId, this.type, this.status});

  ParticipationDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    challengeId = json['challenge_id'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['challenge_id'] = this.challengeId;
    data['type'] = this.type;
    data['status'] = this.status;
    return data;
  }
}
