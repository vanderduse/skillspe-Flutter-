import 'package:skills_pe/screens/challenge_detail/model/participant_detail_response.dart';

class PublicChallengesItemResponse {
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
  ParticipantDetailResponse? participationDetails; // New field
  Source? source;
  int? totalTraders;

  PublicChallengesItemResponse(
      {required this.id,
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
      this.source,
      this.totalTraders});

  factory PublicChallengesItemResponse.fromJson(Map<String, dynamic> json) {
    return PublicChallengesItemResponse(
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
        totalTraders: json['total_traders'],
        options: (json['options'] as List<dynamic>?)
            ?.map((e) => PublicOptions.fromJson(e))
            .toList(),
        bidRatios: (json['bid_ratios'] as List<dynamic>?)
            ?.map((e) => PublicOptions.fromJson(e))
            .toList(),
        participationDetails: json['participation_details'] != null ||
                !json['participation_details'].isEmpty
            ? ParticipantDetailResponse.fromJson(json['participation_details'])
            : null,
        source:
            json['source'] != null ? Source.fromJson(json['source']) : null);
  }
}

class PublicOptions {
  String? label;
  double? value;
  double? bidValue;
  double? bidPercent; // New field

  PublicOptions({this.label, this.value, this.bidPercent});

  PublicOptions.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value']?.toDouble();
    bidValue = json['bid_value']?.toDouble();
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

class Source {
  String? url;
  String? info;
  String? logo;
  String? name; // New field

  Source({this.url, this.info, this.logo, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    info = json['info'];
    logo = json['logo'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['info'] = info;
    data['logo'] = logo;
    data['name'] = name; // Adding bid_percent for bidRatios
    return data;
  }
}
