import 'package:chucker_flutter/chucker_flutter.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:skills_pe/service/storage_service.dart';
import 'package:skills_pe/utility/constants.dart';

class ApiClient {
  static Dio? _dio;

  static Dio? createDio() {
    _dio ??= Dio(BaseOptions(
      baseUrl: BASE_URL,
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 60 * 1000),
      connectTimeout: const Duration(seconds: 60 * 1000),
      sendTimeout: const Duration(seconds: 60 * 1000),
    ));

    _dio?.interceptors.add(
      AppInterceptors(_dio!),
    );

    if (kDebugMode) {
      _dio?.interceptors.add(ChuckerDioInterceptor());
    }

    return _dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;
  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization':
          'Bearer ${await StorageService().readSecureData(ACCESS_TOKEN)}',
      'X-AUTHORIZED-FOR-ID': 'akshay',
    };
    log(options.uri.toString());
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('status code ${err.response?.statusCode}');
    log('error data ${err.response?.data}');
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }
}
