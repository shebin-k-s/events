import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:events/application/authentication/auth_bloc.dart';
import 'package:events/core/constants/api_endpoints.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/domain/profile/models/profile_data_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _dio = Dio();
  String id = '';
  late ProfileDataModel profile;
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfileInfoEvent>(fetchProfileInfoEvent);
    on<UpdateProfileEvent>(updateProfileEvent);
  }

  FutureOr<void> fetchProfileInfoEvent(
      FetchProfileInfoEvent event, Emitter<ProfileState> emit) async {
    try {
      cookieManager.toString();
      _dio.interceptors.add(cookieManager);
      final response = await _dio.post(
        baseUrl + ApiEndpoints.profile,
      );
      log(response.data["data"].toString());
      final ProfileDataModel profileDataModel =
          ProfileDataModel.fromJson(response.data["data"]);

      profile = profileDataModel;

      id = profileDataModel.id.toString();
      emit(FetchProfileSuccessState(profileDataModel: profileDataModel));
    } on DioException catch (e) {
      log("Error on fetch profle: $e");
      // emit(LoginFailure('An error occurred: $e'));
    }
  }

  FutureOr<void> updateProfileEvent(
      UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    try {
      print(event.updateProfile);
      final formData = FormData.fromMap(event.updateProfile);
      cookieManager.toString();
      _dio.interceptors.add(cookieManager);
      final response = await _dio.post(
        baseUrl + ApiEndpoints.updateProfile + '/${id}',
        data: formData,
      );
      log(response.data.toString());

      emit(UpdateProfileSuccess());
      emit(FetchProfileSuccessState(profileDataModel: profile));
    } on DioException catch (e) {
      log("Error on fetch profle: $e");
      emit(UpdateProfileFailure());
    }
  }
}
