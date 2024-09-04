import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:events/domain/user/user_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _dio = Dio();
  final String _loginUrl = "http://192.168.79.24:8080/customer/login";
  final String _signupUrl = "http://192.168.79.24:8080/customer/signup";
  final String _otpVerificationUrl =
      "http://192.168.79.24:8080/customer/validate-otp";

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
      print(response);

      await _handleResponse(response, emit, () {
        return LoginSuccess();
      }, (message) => LoginFailure(message));
    } on DioException catch (e) {
      print(e);

      emit(LoginFailure('An error occurred'));
    }
  }

  FutureOr<void> studentSignupEvent(
      StudentSignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final formData = FormData.fromMap(event.student.toJson());
    print(event.student.toJson());

    try {
      final response = await _dio.post(
        _signupUrl,
        data: formData,
      );
      log("ki");
      log(response.data.toString());

      await _handleResponse(response, emit, () => SignupSuccess(),
          (message) => SignupFailure(message));
    } on DioException catch (e) {
      log(e.toString());
      emit(SignupFailure('An error occurred'));
    }
  }

  FutureOr<void> employeeSignupEvent(
      EmployeeSignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final formData = FormData.fromMap(event.employee.toJson());

    try {
      final response = await _dio.post(
        _signupUrl,
        data: formData,
      );
      print(response.data);

      await _handleResponse(response, emit, () => SignupSuccess(),
          (message) => SignupFailure(message));
    } on DioException catch (e) {
      emit(SignupFailure('An error occurred'));
    }
  }

  FutureOr<void> otherSignupEvent(
      OtherSignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    log('other ');
    print(event.other.toJson());
    final formData = FormData.fromMap(event.other.toJson());

    try {
      final response = await _dio.post(
        _signupUrl,
        data: formData,
      );
      log("lllll");
      print(response.data);

      await _handleResponse(response, emit, () => SignupSuccess(),
          (message) => SignupFailure(message));
    } on DioException catch (e) {
      log(e.toString());
      emit(SignupFailure('An error occurred'));
    }
    print('comple');
  }

  FutureOr<void> otpVerificationEvent(
      OtpVerificationEvent event, Emitter<AuthState> emit) async {
    final formData = FormData.fromMap({
      'contact_no': event.contactNo,
      'otp': event.otp,
    });
    try {
      log('response');
      emit(AuthLoading());

      final response = await _dio.post(
        _otpVerificationUrl,
        data: formData,
      );
      print(response);
      await _handleResponse(response, emit, () => OtpVerificationSuccess(),
          (message) => OtpVerificationFailure(message));
    } on DioException catch (e) {
      emit(SignupFailure('An error occurred'));
    }
  }

  Future<void> _handleResponse(
    Response response,
    Emitter<AuthState> emit,
    AuthState Function() successStateCreator,
    AuthState Function(String) failureStateCreator,
  ) async {
    final status = response.data['status'] ?? 'unknown';
    final message = response.data['message'] ?? 'Unknown error occurred';

    if (status == 'success') {
      final prefs = await SharedPreferences.getInstance();

      emit(successStateCreator());
    } else {
      emit(failureStateCreator(message));
    }
  }
}
