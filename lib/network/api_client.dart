import 'package:dio/dio.dart';
import 'package:skills_pe/utility/constants.dart';

class ApiClient {
  static Dio? _dio;

  static Dio? createDio() {
    _dio ??= Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 60 * 1000),
      connectTimeout: const Duration(seconds: 60 * 1000),
      sendTimeout: const Duration(seconds: 60 * 1000),
    ));

    _dio?.interceptors.addAll({
      AppInterceptors(_dio!),
    });

    return _dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }
}
