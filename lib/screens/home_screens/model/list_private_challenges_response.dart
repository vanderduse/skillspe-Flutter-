class PrivateChallengesListResponse {
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
  String? status;
  double? participationFee;
  List<Option>? options;
  ParticipationDetails? participationDetails;

  PrivateChallengesListResponse(
      {required this.id,
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
      required this.status,
      required this.participationFee,
      this.prizeAmount,
      this.options,
      this.participationDetails});

  factory PrivateChallengesListResponse.fromJson(Map<String, dynamic> json) {
    return PrivateChallengesListResponse(
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
      status: json['status'],
      participationFee: json['participation_fee'],
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e))
          .toList(),
      participationDetails: json['participation_details'] != null
          ? ParticipationDetails.fromJson(json['participation_details'])
          : null,
    );
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
    data['id'] = id;
    data['user_id'] = userId;
    data['challenge_id'] = challengeId;
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}

class Option {
  String? userId;
  String? lastName;
  String? firstName;
  String? profileImgUrl;

  Option({this.userId, this.lastName, this.firstName, this.profileImgUrl});

  Option.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    profileImgUrl = json['profile_img_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['last_name'] = lastName;
    data['first_name'] = firstName;
    data['profile_img_url'] = profileImgUrl;
    return data;
  }
}
