part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class FetchProfileInfoEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final Map<String, String> updateProfile;

  UpdateProfileEvent(this.updateProfile);
}
