part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileDoneState extends ProfileState {
  final ProfileModel profileData;
  ProfileDoneState({required this.profileData});
}

class ProfileErrorState extends ProfileState{
  final String msg;
  ProfileErrorState({required this.msg});
}
