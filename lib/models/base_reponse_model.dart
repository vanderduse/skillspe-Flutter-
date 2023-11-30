import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class BaseResponseModel<T> {
  String message;
  T? data;

  BaseResponseModel({required this.message, this.data});

  factory BaseResponseModel.fromJson(
          Map<String, dynamic> json, T? Function(Object? json)? fromJsonT) =>
      _$BaseResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseModelToJson(this, toJsonT);
}

BaseResponseModel<T> _$BaseResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T? Function(Object? json)? fromJsonT,
) =>
    BaseResponseModel<T>(
      message: json['message'] as String,
      data: fromJsonT!(json['data']),
    );

Map<String, dynamic> _$BaseResponseModelToJson<T>(
  BaseResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'data': toJsonT(instance.data as T),
    };
