import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todos_porto_2/app_resources.dart';
import 'package:todos_porto_2/cubits/auth_cubit.dart';
import 'package:todos_porto_2/cubits/profile_cubit.dart';
import 'package:todos_porto_2/cubits/todo_cubit.dart';
import 'package:todos_porto_2/screens/home_screen.dart';
import 'package:todos_porto_2/screens/register_screen.dart';
import 'package:todos_porto_2/widgets/custom_button.dart';
import 'package:todos_porto_2/widgets/custom_form.dart';
import 'package:todos_porto_2/widgets/custom_scaffold.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _usernameText;
  late TextEditingController _passText;
  BuildContext? _dialogContext;

  @override
  void initState() {
    _usernameText = TextEditingController(text: "lgronaverp");
    _passText = TextEditingController(text: "4a1dAKDv9KB9");
    super.initState();
  }

  @override
  void dispose() {
    _usernameText.dispose();
    _passText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getHeight(context, 10),
            ),
            Text(
              "Welcome Back!",
              style: boldText.copyWith(fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            SvgPicture.asset(
              "assets/imgs/login.svg",
              width: getWidth(context, 50),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, bottom: 1),
              child: const Text(
                "Username",
                style: boldText,
              ),
            ),
            CustomForm(
              textEditingController: _usernameText,
              hintText: "example",
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, bottom: 1),
              child: const Text(
                "Password",
                style: boldText,
              ),
            ),
            CustomForm(
              textEditingController: _passText,
              hintText: "********",
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                "Forgot Password?",
                style: boldText.copyWith(color: colors(context).primaryCr),
              ),
            ),
            SizedBox(
              height: getHeight(context, 5),
            ),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                // if (Navigator.canPop(context)) {
                //   Navigator.pop(context);
                // }
                if (state is AuthLoginLoadingState) {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        _dialogContext = context;
                        return AlertDialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          content: Center(
                            child: CircularProgressIndicator(
                              color: colors(context).secondaryCr,
                            ),
                          ),
                        );
                      });
                } else if (state is AuthLoginDoneState) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => ProfileCubit(),
                          ),
                          BlocProvider(
                            create: (context) => TodoCubit(),
                          ),
                        ],
                        child: const HomeScreen(),
                      ),
                    ),
                  );
                } else if (state is AuthLoginErrorState) {
                  showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: colors(context).secondaryCr,
                          content: const Text(
                            "Username atau password tidak terdaftar",
                            style: semiBoldText,
                          ),
                        );
                      }).then((value) {
                    if (Navigator.canPop(_dialogContext!)) {
                      Navigator.pop(context);
                    }
                  });
                }
              },
              child: CustomButton(
                child: Text(
                  "Login",
                  style: boldText.copyWith(fontSize: 20),
                ),
                onPressed: () {
                  context
                      .read<AuthCubit>()
                      .login(_usernameText.text, _passText.text);
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: normalText.copyWith(fontWeight: FontWeight.w500),
                ),
                InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  child: Text(
                    "Sign up",
                    style: boldText.copyWith(color: colors(context).primaryCr),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
