import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_porto_2/cubits/auth_cubit.dart';
import 'package:todos_porto_2/screens/splash_screen.dart';
import 'package:todos_porto_2/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo\' list',
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSwatch(accentColor: const Color(0XFF62D2C3)),
            useMaterial3: true,
            extensions: const <ThemeExtension<AppColors>>[
              AppColors(
                  primaryCr: Color(0xFF62D2C3),
                  secondaryCr: Color(0xFFE5FFFC),
                  backgroundCr: Color(0xFFEEEEEE),
                  whiteCr: Color(0xFFFFFFFF))
            ]),
        home: const SplashScreens(),
      ),
    );
  }
}
