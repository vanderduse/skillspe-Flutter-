part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class SendOTPEvent extends LoginEvent {
  final String token;
  final String mobileNumber;
  SendOTPEvent({required this.mobileNumber, required this.token});
}
