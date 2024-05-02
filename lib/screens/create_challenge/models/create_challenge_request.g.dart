// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_challenge_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChallengeRequest _$CreateChallengeRequestFromJson(
        Map<String, dynamic> json) =>
    CreateChallengeRequest(
      title: json['title'] as String?,
      description: json['description'] as String?,
      challengeEmoji: json['challenge_emoji'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      participationFee: json['participation_fee'] as int?,
    )..category = json['category'] as String;

Map<String, dynamic> _$CreateChallengeRequestToJson(
        CreateChallengeRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'challenge_emoji': instance.challengeEmoji,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'category': instance.category,
      'participation_fee': instance.participationFee,
    };
