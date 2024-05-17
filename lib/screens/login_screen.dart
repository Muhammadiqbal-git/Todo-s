import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todos_porto_2/app_resources.dart';
import 'package:todos_porto_2/screens/register_screen.dart';
import 'package:todos_porto_2/widgets/custom_button.dart';
import 'package:todos_porto_2/widgets/custom_form.dart';
import 'package:todos_porto_2/widgets/custom_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
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
                "Email",
                style: boldText,
              ),
            ),
            CustomForm(
              textEditingController: TextEditingController(),
              hintText: "iqbal@gmail.com",
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
              textEditingController: TextEditingController(),
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
            CustomButton(
              child: Text(
                "Login",
                style: boldText.copyWith(fontSize: 20),
              ),
              onPressed: () {},
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
