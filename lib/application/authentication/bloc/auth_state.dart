part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
abstract class AuthActionState extends AuthState {}

final class AuthBlocInitial extends AuthState {}

//loading state
class AuthLoading extends AuthState{}


class LoginSuccess extends AuthActionState {
  final String message;

  LoginSuccess(this.message);
}
class LoginFailure extends AuthActionState {
  final String error;

  LoginFailure(this.error);
}
