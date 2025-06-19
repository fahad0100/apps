part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SuccessState extends HomeState {}

final class ErrorState extends HomeState {}
