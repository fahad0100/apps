part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginAccountEvent extends LoginEvent {}

class VerifyAccountEvent extends LoginEvent {
  final String otp;

  VerifyAccountEvent({required this.otp});
}
