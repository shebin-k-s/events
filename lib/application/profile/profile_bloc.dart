import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:events/domain/profile/models/profile_data_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileDataModel? profile;
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfileInfoEvent>(fetchProfileInfoEvent);

    on<LoadProfileEvent>(loadProfileEvent);
  }

  FutureOr<void> fetchProfileInfoEvent(
      FetchProfileInfoEvent event, Emitter<ProfileState> emit) async {}

  FutureOr<void> loadProfileEvent(
      LoadProfileEvent event, Emitter<ProfileState> emit) async {
    // final sharedPref = await SharedPreferences.getInstance();

    profile = ProfileDataModel(
      id: 1,
      firstName: 'John',
      secondName: 'Doe',
      email: 'john.doe@example.com',
      purpose: 'Testing',
      country: 5,
      stateId: 1,
      districtId: 1,
      contactNo: '+1234567890',
      whatsappNo: '+0987654321',
      otp: '123456',
      otpStatus: 'verified',
      passwordHash: 'hashedpassword123',
      authKey: 'authkey1234567890',
      verificationToken: 'verificationtoken1234567890',
      college: 'GEC PALAKKAD',
      status: 1,
      createdAt: 1,
      updatedAt: 1,
      createdBy: 1,
      updatedBy: 1,
    );

    emit(
      ProfileLoaded(
        ProfileDataModel(
          id: 1,
          firstName: 'John',
          secondName: 'Doe',
          email: 'john.doe@example.com',
          purpose: 'Testing',
          country: 5,
          stateId: 1,
          districtId: 1,
          contactNo: '+1234567890',
          whatsappNo: '+0987654321',
          otp: '123456',
          otpStatus: 'verified',
          passwordHash: 'hashedpassword123',
          authKey: 'authkey1234567890',
          verificationToken: 'verificationtoken1234567890',
          college: 'GEC PALAKKAD',
          status: 1,
          createdAt: 1,
          updatedAt: 1,
          createdBy: 1,
          updatedBy: 1,
        ),
      ),
    );
  }

  ProfileDataModel? getProfile() => profile;
}
