part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class FetchProfileSuccessState extends ProfileState {
  final ProfileDataModel profileDataModel;

  FetchProfileSuccessState({required this.profileDataModel});
}

final class FetchProfileFailureState extends ProfileState {}