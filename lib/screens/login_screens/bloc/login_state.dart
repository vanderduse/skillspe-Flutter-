part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginOTPSendSuccessState extends LoginState {
  final String? message;
  LoginOTPSendSuccessState(this.message);
}

class LoginOTPSendFailureState extends LoginState {}
