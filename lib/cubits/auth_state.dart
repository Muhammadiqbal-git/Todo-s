part of 'auth_cubit.dart';

abstract class AuthState{
}

class AuthInitialState extends AuthState{
}
class AuthLoginLoadingState extends AuthState{
}
class AuthLoginErrorState extends AuthState{
  final String msg;
  AuthLoginErrorState({required this.msg});
}

class AuthLoginDoneState extends AuthState{}