import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:skills_pe/models/base_reponse_model.dart';
import 'package:skills_pe/service/api_client.dart';
import 'package:skills_pe/screens/login_screens/models/otp_request_model.dart';
import 'package:skills_pe/screens/login_screens/models/otp_response_model.dart';
import 'package:skills_pe/screens/login_screens/models/verify_otp_request_model.dart';
import 'package:skills_pe/screens/login_screens/models/verify_otp_response_model.dart';

class SendOTPRepository {
  final Dio? _dio = ApiClient.createDio();

  Future<SendOTPResponseModel> sendOTP(OtpRequestModel otpRequest) async {
    try {
      Response? response = await _dio?.post(
        '/api/uranus/v1/otp/send/',
        data: otpRequest,
      );
      return SendOTPResponseModel.fromJson(
          response?.data as Map<String, dynamic>);
    } on DioException catch (error) {
      return SendOTPResponseModel.fromJson(
          error.response?.data as Map<String, dynamic>);
    }
  }

  Future<BaseResponseModel<VerifyOtpResponseModel>> verifyOTP(
      VerifyOtpRequestModel verifyOtp) async {
    late BaseResponseModel<VerifyOtpResponseModel> responseModel;
    try {
      Response? response = await _dio?.post(
        '/api/zeus/v1/login',
        data: verifyOtp,
      );
      responseModel = BaseResponseModel<VerifyOtpResponseModel>.fromJson(
          response?.data,
          (data) =>
              VerifyOtpResponseModel.fromJson(data as Map<String, dynamic>));
      responseModel.success = true;
    } on DioException catch (error) {
      print(error.response?.data);
      responseModel = BaseResponseModel<VerifyOtpResponseModel>.fromJson(
          error.response?.data as Map<String, dynamic>, (data) => null);
      responseModel.success = false;
    }
    return responseModel;
  }
}
