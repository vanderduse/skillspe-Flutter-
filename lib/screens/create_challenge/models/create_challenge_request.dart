import 'package:json_annotation/json_annotation.dart';
part 'create_challenge_request.g.dart';

@JsonSerializable()
class CreateChallengeRequest {
  String? title = "";
  String? description = "";
  @JsonKey(name: "challenge_emoji")
  String? challengeEmoji = "";
  bool? public = true;
  @JsonKey(name: "start_time")
  String? startTime = "";
  @JsonKey(name: "end_time")
  String? endTime = "";
  String category = "TOURNAMENT";
  @JsonKey(name: "participation_fee")
  int? participationFee = 5;

  CreateChallengeRequest(
      {this.title,
      this.description,
      this.challengeEmoji,
      this.public = true,
      this.startTime,
      this.endTime,
      this.participationFee});

  factory CreateChallengeRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateChallengeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateChallengeRequestToJson(this);
}
