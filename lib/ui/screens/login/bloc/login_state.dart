part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoadingState extends LoginState {}

final class SuccessState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class UpdateState extends LoginState {}

final class ErrorState extends LoginState {
  final String msg;

  ErrorState({required this.msg});
}
