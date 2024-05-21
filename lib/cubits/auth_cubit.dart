import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_porto_2/core/services/auth_api.dart';

part 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  final AuthApi api = AuthApi();

  login(String username, String password) async{
    emit(AuthLoginLoadingState());
    try {
      await api.login(username, password);
      emit(AuthLoginDoneState());
    } catch (e) {
      emit(AuthLoginErrorState(msg: e.toString()));
    }
  }
}