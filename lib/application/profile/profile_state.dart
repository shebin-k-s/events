part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {
  
}

final class ProfileInitial extends ProfileState {
  
}

abstract class ProfileActionState extends ProfileState {}

// Profile loading
class ProfileLoaded extends ProfileState {
  final ProfileDataModel profile;

  ProfileLoaded(this.profile);
}

