import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(loginEvent);
  }

  FutureOr<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      log("Logging in...");
      
      final response = await Dio().post(
        "http://10.0.2.2/customer/login", // Adjusted URL
        // data: {
        //   'firstname': event.firstname,
        //   'password': event.password,
        // },  
      );

      log(response.data);
 
      if (response.statusCode == 200) {
        log("Login success");
        emit(LoginSuccess('Login Successful'));
      } else {
        log("LSomething went wrong");
        emit(LoginFailure('Login Failed'));
      }
    }on DioException catch (e) {
      log("Login error: $e");
      log("Login error: ${e.response?.statusCode}");
      emit(LoginFailure('An error occurred: $e'));
    }
    print("updated");
    emit(LoginFailure("suce"));
  }
}
