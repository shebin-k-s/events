import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/api_endpoints.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/domain/profile/models/profile_data_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _dio = Dio();
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfileInfoEvent>(fetchProfileInfoEvent);
  }

  FutureOr<void> fetchProfileInfoEvent(
      FetchProfileInfoEvent event, Emitter<ProfileState> emit) async {
    try {
      // final formData = FormData.fromMap({
      //   'auth_token': "ORgUWLUIl9P_cJrVAdXQ5SvUxWcCb-7w",
      // });
      cm.toString();
      _dio.interceptors.add(cm);
      final response = await _dio.post(
        baseUrl + ApiEndpoints.profile,
        // "http://192.168.29.15:8080/customer/user-profile?auth_key=561q2nomg4YvS8hsJrVMMzxmokuf0nrG",
        // queryParameters: {
        //   "auth_token": "ORgUWLUIl9P_cJrVAdXQ5SvUxWcCb-7w",
        // },
        // data: formData
      );
      log(response.data.toString());
      if (response != null) {
        final ProfileDataModel profileDataModel =
            ProfileDataModel.fromJson(response.data);
        emit(FetchProfileSuccessState(profileDataModel: profileDataModel));
      }

      // _handleResponse(response, emit, () => LoginSuccess(),
      //     (message) => LoginFailure(message));
    } on DioException catch (e) {
      log("Error on fetch profle: $e");
      // emit(LoginFailure('An error occurred: $e'));
    }
  }
}
