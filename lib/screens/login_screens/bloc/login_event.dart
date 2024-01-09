part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoadFirebaseCaptchaEvent extends LoginEvent {}

class SendOTPEvent extends LoginEvent {
  final String token;
  final String mobileNumber;
  SendOTPEvent({required this.mobileNumber, required this.token});
}

class VerifyOTPEvent extends LoginEvent {
  final String otp;
  final String mobileNumber;
  VerifyOTPEvent({required this.otp, required this.mobileNumber});
}
