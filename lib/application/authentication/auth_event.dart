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

// class SignupEvent extends AuthEvent {
//   final String countryCode;
//   final String email;
//   final String password;

//   SignupEvent({
//     required this.countryCode,
//     required this.email,
//     required this.password,
//   });
// }

class StudentSignupEvent extends AuthEvent {
  final Student student;

  StudentSignupEvent({required this.student});
}

class EmployeeSignupEvent extends AuthEvent {
  final Employee employee;

  EmployeeSignupEvent({required this.employee});
}

class OtherSignupEvent extends AuthEvent {
  final String countryCode;
  final String email;
  final String password;

  OtherSignupEvent({
    required this.countryCode,
    required this.email,
    required this.password,
  });
}

class OtpVerificationEvent extends AuthEvent {
  final String contactNo;
  final String otp;

  OtpVerificationEvent({
    required this.contactNo,
    required this.otp,
  });
}


class GoogleAuthEvent extends AuthEvent {
  final String contactNo;
  final String otp;

  GoogleAuthEvent({
    required this.contactNo,
    required this.otp,
  });
}

