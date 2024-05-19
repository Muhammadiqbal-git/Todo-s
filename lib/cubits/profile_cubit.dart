import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_porto_2/core/models/profile_model.dart';
import 'package:todos_porto_2/core/services/auth_api.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileLoadingState());

 getProfile() async {
    emit(ProfileLoadingState());
    try {
      ProfileModel data = await AuthApi().getProfile();
      emit(ProfileDoneState(profileData: data));
    } catch (e) {
      emit(ProfileErrorState(msg: e.toString()));
    }
  }
}
