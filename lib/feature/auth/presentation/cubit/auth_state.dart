part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}
final class LoginSuccessState extends AuthState {}
final class LoginErrorState extends AuthState {
  final String erorrMessage;
  LoginErrorState(this.erorrMessage);
}


final class registerLoadingState extends AuthState {}
final class registerSuccessState extends AuthState {}
final class registerErrorState extends AuthState {
  final String erorrMessage;
  registerErrorState(this.erorrMessage);
}