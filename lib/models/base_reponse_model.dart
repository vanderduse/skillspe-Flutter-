import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class BaseResponseModel<T> {
  String? message;
  // String? error;
  String? responseCode;
  // bool? success;
  T? data;
  Pagination? pagination;

  BaseResponseModel({
    required this.message,
    this.data,
    // this.success,
    // this.error,
    this.responseCode,
    this.pagination,
  });

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T? Function(Object? json)? fromJsonT,
  ) =>
      _$BaseResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseModelToJson(this, toJsonT);
}

class Pagination {
  dynamic count;
  bool? hasNext;
  bool? hasPrevious;

  Pagination({this.count, this.hasNext, this.hasPrevious});

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

BaseResponseModel<T> _$BaseResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T? Function(Object? json)? fromJsonT,
) =>
    BaseResponseModel<T>(
      message: json['message'] as String?,
      // error: json['error'] as String?,
      // success: json['success'] as bool?,
      responseCode: json['response_code'] as String?,
      data: fromJsonT!(json['data']),
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );

Map<String, dynamic> _$BaseResponseModelToJson<T>(
  BaseResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      // 'success': instance.success,
      // 'error': instance.error,
      'response_code': instance.responseCode,
      'data': toJsonT(instance.data as T),
      'pagination': instance.pagination?.toJson(),
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return Pagination(
    count: json['count'] as dynamic,
    hasNext: json['has_next'] as bool?,
    hasPrevious: json['has_previous'] as bool?,
  );
}

Map<String, dynamic> _$PaginationToJson(Pagination instance) {
  return <String, dynamic>{
    'count': instance.count,
    'has_next': instance.hasNext,
    'has_previous': instance.hasPrevious,
  };
}
