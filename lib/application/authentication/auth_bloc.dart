import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:events/core/constants/api_endpoints.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/domain/user/user_model.dart';
import 'package:meta/meta.dart';

import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

final cookieJar = CookieJar();
final CookieManager cookieManager = CookieManager(cookieJar);

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _dio = Dio(
    BaseOptions(
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        responseType: ResponseType.json,
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20)),
  );

  final String _loginUrl = "$baseUrl/customer/login";
  final String _signupUrl = "$baseUrl/customer/signup";
  final String forgotOtp = "$baseUrl/events/customer/forgot-password";
  final String verifyOtp = "$baseUrl/events/customer/pass-verify-otp";

  final String _otpVerificationUrl = "$baseUrl/customer/validate-otp";

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(loginEvent);
    on<OtherSignupEvent>(signupEvent);
    on<StudentSignupEvent>(studentSignupEvent);
    on<EmployeeSignupEvent>(employeeSignupEvent);
    // on<OtherSignupEvent>(otherSignupEvent);
    on<OtpVerificationEvent>(otpVerificationEvent);

    on<SendForgotOtpEvent>(sendForgotOtpEvent);
    on<VerifyForgotOtpEvent>(verifyForgotOtpEvent);
  }

  FutureOr<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    // Add CookieManager interceptor
    _dio.interceptors.add(cookieManager);

    try {
      final formData = FormData.fromMap({
        'login': event.firstname,
        'password': event.password,
      });

      final response = await _dio.post(
        "$baseUrl${ApiEndpoints.login}",
        data: formData,
      );
      log(response.toString());
      await _handleResponse(response, emit, (message) {
        return LoginSuccess();
      }, (message) => LoginFailure(message));
    } on DioException catch (e) {
      print(e);

      emit(LoginFailure('An error occurred'));
    }
  }

  FutureOr<void> signupEvent(
      OtherSignupEvent event, Emitter<AuthState> emit) async {
    log("trying signup");
    log(_signupUrl);
    emit(AuthLoading());

    final formData = FormData.fromMap({
      'country': event.countryCode,
      'combined': event.email,
      'password': event.password,
    });
    // print(event.student.toJson());

    try {
      final response = await _dio.post(
        "$baseUrl${ApiEndpoints.signUp}",
        data: formData,
      );
      log("ki");
      log(response.data.toString());

      await _handleResponse(response, emit, (message) => SignupSuccess(),
          (message) => SignupFailure(message));
    } on DioException catch (e) {
      log(e.toString());
      emit(SignupFailure('An error occurred'));
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

      await _handleResponse(response, emit, (message) => SignupSuccess(),
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

      await _handleResponse(response, emit, (message) => SignupSuccess(),
          (message) => SignupFailure(message));
    } on DioException catch (e) {
      emit(SignupFailure('An error occurred'));
    }
  }

  // FutureOr<void> otherSignupEvent(
  //     OtherSignupEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoading());
  //   log('other ');
  //   print(event.other.toJson());
  //   final formData = FormData.fromMap(event.other.toJson());

  //   try {
  //     final response = await _dio.post(
  //       _signupUrl,
  //       data: formData,
  //     );
  //     log("lllll");
  //     print(response.data);

  //     await _handleResponse(response, emit, () => SignupSuccess(),
  //         (message) => SignupFailure(message));
  //   } on DioException catch (e) {
  //     log(e.toString());
  //     emit(SignupFailure('An error occurred'));
  //   }
  //   print('comple');
  // }

  FutureOr<void> otpVerificationEvent(
      OtpVerificationEvent event, Emitter<AuthState> emit) async {
    final formData = FormData.fromMap({
      'email': "ajsp123@gmail.com",
      'otp': event.otp,
    });
    print(event.contactNo);
    try {
      log('response');
      emit(AuthLoading());

      final response = await _dio.post(
        "$baseUrl${ApiEndpoints.verifyOtp}",
        data: formData,
      );
      print(response);
      await _handleResponse(
          response,
          emit,
          (message) => OtpVerificationSuccess(),
          (message) => OtpVerificationFailure(message));
    } on DioException catch (e) {
      emit(SignupFailure('An error occurred'));
    }
  }

  Future<void> _handleResponse(
    Response response,
    Emitter<AuthState> emit,
    AuthState Function(String) successStateCreator,
    AuthState Function(String) failureStateCreator,
  ) async {
    final status = response.data['success'] ?? 'unknown';
    final message = response.data['message'] ?? 'Unknown error occurred';

    if (status == true) {
      emit(successStateCreator(message));
    } else {
      emit(failureStateCreator(message));
    }
  }

  FutureOr<void> sendForgotOtpEvent(
    SendForgotOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    final formData = FormData.fromMap({
      'login': event.userameOrEmail,
    });
    try {
      emit(AuthLoading());

      final response = await _dio.post(
        forgotOtp,
        data: formData,
      );
      log(response.toString());
      await _handleResponse(
          response,
          emit,
          (message) => ForgotSuccess(message: message),
          (message) => ForgotFailure(error: message));
    } on DioException catch (e) {
      log(e.toString());
      emit(ForgotFailure(error: 'An error occurred'));
    }
  }

  FutureOr<void> verifyForgotOtpEvent(
    VerifyForgotOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    final formData = FormData.fromMap({
      'otp': event.otp
    });
    try {
      log("verify otp screen");
      emit(AuthLoading());
      log(verifyOtp);
      final response = await _dio.post(verifyOtp,
          queryParameters: {
            'contact': event.contact,
          },
          data: formData);

      log(response.toString());
      bool status = false;
      String message = "error";
      if (response.data['errors'] != null &&
          response.data['errors']['otp'][0] != null) {
        message = response.data['errors']['otp'][0];
      } else if (response.data['message'] != null) {
        message = response.data['message'];
      }
      if (response.data['success'] != null) {
        status = response.data['success'];
      } else if (response.data['error'] != null) {
        status = response.data['error'];
      }
      if (status == true) {
        emit(ForgotSuccess(message: message));
      } else {
        emit(ForgotFailure(error: message));
      }
      // await _handleResponse(
      //     response,
      //     emit,
      //     (message) => ForgotSuccess(message: message),
      //     (message) => ForgotFailure(message));
    } on DioException catch (e) {
      log(e.toString());
      emit(ForgotFailure(error: 'An error occurred'));
    }
  }
}
