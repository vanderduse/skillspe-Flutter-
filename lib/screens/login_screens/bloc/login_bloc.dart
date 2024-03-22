import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/login_screens/models/otp_request_model.dart';
import 'package:skills_pe/screens/login_screens/models/verify_otp_request_model.dart';
import 'package:skills_pe/screens/login_screens/models/verify_otp_response_model.dart';
import 'package:skills_pe/service/storage_service.dart';
import 'package:skills_pe/utility/constants.dart';
import '../repository/send_otp_respository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SendOTPRepository _sendOTPRepository;
  LoginBloc(this._sendOTPRepository) : super(LoginInitialState()) {
    on<LoadFirebaseCaptchaEvent>(loadFirebaseCaptchaEvent);
    on<SendOTPEvent>(sendOTPEvent);
    on<VerifyOTPEvent>(verifyOTPEvent);
  }

  FutureOr<void> loadFirebaseCaptchaEvent(
      LoadFirebaseCaptchaEvent event, Emitter<LoginState> emit) {
    emit(LoginLoadFirebaseCaptchaState());
  }

  FutureOr<void> sendOTPEvent(
      SendOTPEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    var response = await _sendOTPRepository.sendOTP(OtpRequestModel(
        recaptchaToken: event.token, mobileNumber: event.mobileNumber));
    if (response.message != null) {
      emit(LoginOTPSendSuccessState(message: response.message!));
    }
    if (response.error != null) {
      emit(LoginOTPSendFailureState(error: response.error!));
    }
  }

  FutureOr<void> verifyOTPEvent(
      VerifyOTPEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    var response = await _sendOTPRepository.verifyOTP(VerifyOtpRequestModel(
        otp: event.otp, mobileNumber: event.mobileNumber));
    if (response.responseCode == API_SUCCESS_CODE) {
      StorageService()
          .writeSecureData(ACCESS_TOKEN, response.data?.tokenDetails?.access);
      StorageService()
          .writeSecureData(REFRESH_TOKEN, response.data?.tokenDetails?.refresh);
      emit(VerifyOtpSuccessState(
          message: response.message!, verifyOtpResponseModel: response.data!));
    } else {
      if (response.responseCode != API_SUCCESS_CODE) {
        emit(VerifyOtpFailureState(error: response.message!));
      } else if (response.message != null) {
        emit(VerifyOtpFailureState(error: response.message!));
      }
    }
  }
}
