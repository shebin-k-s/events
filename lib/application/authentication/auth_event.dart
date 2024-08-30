part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


class LoginEvent extends AuthEvent {
  final String firstname;
  final String password;

  LoginEvent({
    required this.firstname,
    required this.password,
  });
}

class SignupEvent extends AuthEvent {
  final String firstname;
  final String password;

  SignupEvent({required this.firstname, required this.password});
}