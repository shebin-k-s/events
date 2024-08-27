import 'dart:async';

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
      final response = await Dio().post(
        "http://10.0.2.2:8000/customer/login", // Adjusted URL
        data: {
          'firstname': event.firstname,
          'password': event.password,
        },
      );

      if (response.statusCode == 200) {
        emit(LoginSuccess('Login Successful'));
      } else {
        emit(LoginFailure('Login Failed'));
      }
    } catch (e) {
      emit(LoginFailure('An error occurred: $e'));
    }
    print("updated");
    emit(LoginFailure("suce"));
  }
}
