class PublicChallengesListResponse {
  String? id;
  String? title;
  String? description;
  String? challengeEmoji;
  bool? isPublic;
  String startTime;
  String endTime;
  double? prizeAmount;
  String? status;
  double? participationFee;
  List<PublicOptions>? options;
  List<PublicOptions>? bidRatios; // New field
  dynamic participationDetails; // New field

  PublicChallengesListResponse({
    required this.id,
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
    this.bidRatios,
    this.participationDetails,
  });

  factory PublicChallengesListResponse.fromJson(Map<String, dynamic> json) {
    return PublicChallengesListResponse(
      id: json['id'],
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
          ?.map((e) => PublicOptions.fromJson(e))
          .toList(),
      bidRatios: (json['bid_ratios'] as List<dynamic>?)
          ?.map((e) => PublicOptions.fromJson(e))
          .toList(),
      participationDetails: json['participation_details'],
    );
  }
}

class PublicOptions {
  String? label;
  double? value;
  double? bidPercent; // New field

  PublicOptions({this.label, this.value, this.bidPercent});

  PublicOptions.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value']?.toDouble();
    bidPercent =
        json['bid_percent']?.toDouble(); // Parsing bid_percent for bidRatios
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    data['bid_percent'] = bidPercent; // Adding bid_percent for bidRatios
    return data;
  }
}
