import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:skills_pe/screens/login_screens/models/otp_request_model.dart';
import '../repository/send_otp_respository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SendOTPRepository _sendOTPRepository;
  LoginBloc(this._sendOTPRepository) : super(LoginInitialState()) {
    on<SendOTPEvent>(sendOTPEvent);
  }

  FutureOr<void> sendOTPEvent(
      SendOTPEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    var response = await _sendOTPRepository.sendOTP(OtpRequestModel(
        recaptchaToken: event.token, mobileNumber: event.mobileNumber));
    print('aaaa ${response.success}');
    print('eeee ${response.message}');
    //emit(LoginOTPSendSuccessState(response.message));
    emit(LoginOTPSendFailureState());
  }
}
