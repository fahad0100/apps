part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SuccessState extends SignUpState {}

final class UpdateState extends SignUpState {}

final class ErrorState extends SignUpState {
  final String msg;

  ErrorState({required this.msg});
}
