import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:events/domain/user/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _dio = Dio();
  final String _loginUrl = "http://192.168.197.24:8080/customer/login";
  final String _signupUrl = "http://192.168.197.24:8080/customer/signup";
  final String _otpVerificationUrl =
      "http://192.168.197.24:8080/customer/validate-otp";

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(loginEvent);
    on<StudentSignupEvent>(studentSignupEvent);
    on<EmployeeSignupEvent>(employeeSignupEvent);
    on<OtherSignupEvent>(otherSignupEvent);
    on<OtpVerificationEvent>(otpVerificationEvent);
  }

  FutureOr<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {

      final formData = FormData.fromMap({
        'first_name': event.firstname,
        'password': event.password,
      });

      final response = await _dio.post(
        _loginUrl,
        data: formData,
      );

      _handleResponse(response, emit, () => LoginSuccess(),
          (message) => LoginFailure(message));
    } on DioException catch (e) {
      emit(LoginFailure('An error occurred: $e'));
    }
  }

  FutureOr<void> studentSignupEvent(
      StudentSignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final response = await _dio.post(
        _signupUrl,
        data: event.student.toJson(),
      );

      _handleResponse(response, emit, () => SignupSuccess(),
          (message) => SignupFailure(message));
    } on DioException catch (e) {
      emit(SignupFailure('An error occurred: $e'));
    }
  }

  FutureOr<void> employeeSignupEvent(
      EmployeeSignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final response = await _dio.post(
        _signupUrl,
        data: event.employee.toJson(),
      );

      _handleResponse(response, emit, () => SignupSuccess(),
          (message) => SignupFailure(message));
    } on DioException catch (e) {
      emit(SignupFailure('An error occurred: $e'));
    }
  }

  FutureOr<void> otherSignupEvent(
      OtherSignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final response = await _dio.post(
        _signupUrl,
        data: event.other.toJson(),
      );

      _handleResponse(response, emit, () => SignupSuccess(),
          (message) => SignupFailure(message));
    } on DioException catch (e) {
      emit(SignupFailure('An error occurred: $e'));
    }
  }

  FutureOr<void> otpVerificationEvent(
      OtpVerificationEvent event, Emitter<AuthState> emit) async {
    final formData = FormData.fromMap({
      'contact_no': event.contactNo,
      'otp': event.otp,
    });
    try {
      final response = await _dio.post(
        _otpVerificationUrl,
        data: formData,
      );
      print(response);
      _handleResponse(response, emit, () => OtpVerificationSuccess(),
          (message) => OtpVerificationFailure(message));
    } on DioException catch (e) {
      emit(SignupFailure('An error occurred: $e'));
    }
  }

  void _handleResponse(
    Response response,
    Emitter<AuthState> emit,
    AuthState Function() successStateCreator,
    AuthState Function(String) failureStateCreator,
  ) {
    final status = response.data['status'] ?? 'unknown';
    final message = response.data['message'] ?? 'Unknown error occurred';

    if (status == 'success') {
      emit(successStateCreator());
    } else {
      emit(failureStateCreator(message));
    }
  }
}
