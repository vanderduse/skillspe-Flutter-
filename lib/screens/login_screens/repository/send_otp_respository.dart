// api/api_service.dart

import 'package:dio/dio.dart';
import 'package:skills_pe/network/api_client.dart';
import 'package:skills_pe/screens/login_screens/models/otp_request_model.dart';
import 'package:skills_pe/screens/login_screens/models/otp_response_model.dart';

class SendOTPRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<SendOTPResponseModel> sendOTP(OtpRequestModel otpRequest) async {
    try {
      print('dio: $_dio');
      print('dio: ${otpRequest.toJson()}');
      Response? response = await _dio?.post(
        '/api/uranus/v1/otp/send/',
        data: otpRequest,
      );
      print('response: $response');
      return SendOTPResponseModel.fromJson(
          response?.data as Map<String, dynamic>);
    } on DioException catch (error) {
      print('exception: $error');
      return SendOTPResponseModel.fromJson(
          error.response?.data as Map<String, dynamic>);
    }
  }
}
