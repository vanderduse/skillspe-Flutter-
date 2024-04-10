class PublicChallengesListResponse {
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

  PublicChallengesListResponse({
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
    required this.status,
    required this.participationFee,
    this.prizeAmount,
    this.options,
  });

  factory PublicChallengesListResponse.fromJson(Map<String, dynamic> json) {
    return PublicChallengesListResponse(
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
    );
  }
}

class Option {
  String? label;
  double? value;

  Option({this.label, this.value});

  Option.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    return data;
  }
}
