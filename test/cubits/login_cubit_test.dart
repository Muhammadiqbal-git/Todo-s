import 'package:flutter_test/flutter_test.dart';
import 'package:todos_porto_2/cubits/auth_cubit.dart';


void main(){
  group("Login Cubit Test", () { 
    late AuthCubit authCubit;

    setUp(() {
      authCubit = AuthCubit();
    });

    tearDown(() {
      authCubit.close();
    });

    test('Initial State is AuthInitialState', () {
      //assert
      expect(authCubit.state, isA<AuthInitialState>());
    });

    test('Emit [AuthLoginLoadingState, AuthLoginDoneState] when Login succeed', ()  {
      final expectedState = [isA<AuthLoginLoadingState>(), isA<AuthLoginDoneState>()];

      expectLater(authCubit.stream, emitsInOrder(expectedState));
       authCubit.login("lgronaverp", "4a1dAKDv9KB9");
    } );

    test('Emit [AuthLoginLoadingState, AuthLoginErrorState] when Login Failed', ()  {
      final expectedState = [isA<AuthLoginLoadingState>(), isA<AuthLoginErrorState>()];

      expectLater(authCubit.stream, emitsInOrder(expectedState));
       authCubit.login("lgronaverp", "not his password");
    } );

  });
}