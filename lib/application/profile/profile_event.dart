part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}


class FetchProfileInfoEvent extends ProfileEvent{}


class LoadProfileEvent extends ProfileEvent{}