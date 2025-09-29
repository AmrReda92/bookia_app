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


final class RegisterLoadingState extends AuthState {}
final class RegisterSuccessState extends AuthState {}
final class RegisterErrorState extends AuthState {
  final String erorrMessage;
  RegisterErrorState(this.erorrMessage);
}