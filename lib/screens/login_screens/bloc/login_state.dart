part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadFirebaseCaptchaState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginOTPSendSuccessState extends LoginState {
  final String message;
  LoginOTPSendSuccessState({required this.message});
}

class LoginOTPSendFailureState extends LoginState {
  final String error;
  LoginOTPSendFailureState({required this.error});
}

class VerifyOtpSuccessState extends LoginState {
  final String message;
  final VerifyOtpResponseModel verifyOtpResponseModel;
  VerifyOtpSuccessState(
      {required this.message, required this.verifyOtpResponseModel});
}

class VerifyOtpFailureState extends LoginState {
  final String error;
  VerifyOtpFailureState({required this.error});
}
