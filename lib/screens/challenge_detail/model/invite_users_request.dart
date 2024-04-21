import 'package:json_annotation/json_annotation.dart';
part 'invite_users_request.g.dart';

@JsonSerializable()
class InviteUsersRequest {
  @JsonKey(name: "participant_type")
  String participantType;
  @JsonKey(name: "user_id")
  List<String> userIds;

  InviteUsersRequest({required this.participantType, required this.userIds});

  factory InviteUsersRequest.fromJson(Map<String, dynamic> json) =>
      _$InviteUsersRequestFromJson(json);
  Map<String, dynamic> toJson() => _$InviteUsersRequestToJson(this);
}
