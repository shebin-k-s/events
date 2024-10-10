part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileActionState extends ProfileState{}


final class FetchProfileSuccessState extends ProfileState {
  final ProfileDataModel profileDataModel;

  FetchProfileSuccessState({required this.profileDataModel});
}

final class FetchProfileFailureState extends ProfileState {}

//edit profile
final class ProfileUpdating extends ProfileState{}
final class UpdateProfileSuccess extends ProfileActionState {}
final class UpdateProfileFailure extends ProfileActionState {}