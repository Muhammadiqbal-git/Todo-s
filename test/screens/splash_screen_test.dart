import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todos_porto_2/cubits/auth_cubit.dart';
import 'package:todos_porto_2/screens/login_screen.dart';
import 'package:todos_porto_2/screens/splash_screen.dart';
import 'package:todos_porto_2/theme.dart';
import 'package:todos_porto_2/widgets/custom_button.dart';

void main() {
  group("Onboarding Screen Test", () {
    // setUp(() {
    //   // TestWidgetsFlutterBinding.ensureInitialized();
    // });
    Future<dynamic> createOnBoardingUI(WidgetTester tester) async {
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(extensions: const <ThemeExtension<AppColors>>[
            AppColors(
                primaryCr: Color(0xFF62D2C3),
                secondaryCr: Color(0xFFE5FFFC),
                backgroundCr: Color(0xFFEEEEEE),
                whiteCr: Color(0xFFFFFFFF))
          ]),
          home: const SplashScreens(),
        ),
      ));
    }

    testWidgets('Onboarding UI Test', (WidgetTester tester) async {
      //arrange
      // Build our app and trigger a frame.
      await createOnBoardingUI(tester);
      // assert
      expect(find.text("Get things done with TODO's"), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);


    });
    testWidgets('Onboarding Navigation Test', (WidgetTester tester) async{
      //arrange
      // Build our app and trigger a frame.
      await createOnBoardingUI(tester);

      //act
      // Navigate to loginScreen
      await tester.tap(find.byType(CustomButton));
      await tester.pumpAndSettle();

      //assert
      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.text("Welcome Back!"), findsOneWidget);
    });
  });
}
