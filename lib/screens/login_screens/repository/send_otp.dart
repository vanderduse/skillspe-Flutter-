// api/api_service.dart

import 'package:dio/dio.dart';
import 'package:skills_pe/network/api_client.dart';
import 'package:skills_pe/screens/login_screens/models/otp_request_model.dart';

class ApiService {
  final Dio _dio = ApiClient.createDio();

  Future<void> sendOtp(OtpRequestModel otpRequest) async {
    try {
      final response = await _dio.post(
        '/api/uranus/v1/otp/send/',
        data: otpRequest.toJson(),
      );

      if (response.statusCode == 200) {
        print('OTP Sent successfully');
      } else {
        print('Failed to send OTP. Status code: ${response.statusCode}');
        print('Response body: ${response.data}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
