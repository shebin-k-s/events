part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

abstract class AuthActionState extends AuthState {}

final class AuthBlocInitial extends AuthState {}

//loading state
class AuthLoading extends AuthState {}

//login
class LoginSuccess extends AuthActionState {}

class LoginFailure extends AuthActionState {
  final String error;
  LoginFailure(this.error);
}

//signup
class SignupSuccess extends AuthActionState {}

class SignupFailure extends AuthActionState {
  final String error;

  SignupFailure(this.error);
}

//otp verification
class OtpVerificationSuccess extends AuthActionState {}

class OtpVerificationFailure extends AuthActionState {
  final String error;

  OtpVerificationFailure(this.error);
}
