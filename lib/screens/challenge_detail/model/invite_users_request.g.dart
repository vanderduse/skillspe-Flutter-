// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_users_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteUsersRequest _$InviteUsersRequestFromJson(Map<String, dynamic> json) {
  return InviteUsersRequest(
    participantType: json['participant_type'] as String,
    userIds:
        (json['user_id'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$InviteUsersRequestToJson(InviteUsersRequest instance) =>
    <String, dynamic>{
      'participant_type': instance.participantType,
      'user_id': instance.userIds,
    };
