import 'package:flutter/material.dart';
import 'package:todos_porto_2/app_resources.dart';
import 'package:todos_porto_2/screens/login_screen.dart';
import 'package:todos_porto_2/widgets/custom_button.dart';
import 'package:todos_porto_2/widgets/custom_form.dart';
import 'package:todos_porto_2/widgets/custom_scaffold.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getHeight(context, 15),
            ),
            Text(
              "Welcome Back!",
              style: boldText.copyWith(fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Lets help you in completing your tasks",
              style: semiBoldText,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, bottom: 1),
              child: const Text(
                "Full name",
                style: boldText,
              ),
            ),
            CustomForm(
              textEditingController: TextEditingController(),
              hintText: "Muhammad Iqbal",
            ),
            const SizedBox(
              height: 10,
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
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, bottom: 1),
              child: const Text(
                "Confirm password",
                style: boldText,
              ),
            ),
            CustomForm(
              textEditingController: TextEditingController(),
              hintText: "********",
            ),
            SizedBox(
              height: getHeight(context, 6),
            ),
            CustomButton(
              child: Text(
                "Register",
                style: boldText.copyWith(fontSize: 20),
              ),
              onPressed: () {
              },
            ),
            const SizedBox(height: 5,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: semiBoldText,
                ),
                InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  child: Text(
                    "Sign in",
                    style: boldText.copyWith(color: colors(context).primaryCr),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
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
