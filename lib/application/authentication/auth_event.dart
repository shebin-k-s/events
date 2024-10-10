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

class StudentSignupEvent extends AuthEvent {
  final Student student;

  StudentSignupEvent({required this.student});
}

class EmployeeSignupEvent extends AuthEvent {
  final Employee employee;

  EmployeeSignupEvent({required this.employee});
}

class OtherSignupEvent extends AuthEvent {
  final User other;

  OtherSignupEvent({required this.other});
}

class OtpVerificationEvent extends AuthEvent {
  final String contactNo;
  final String otp;

  OtpVerificationEvent({
    required this.contactNo,
    required this.otp,
  });
}
