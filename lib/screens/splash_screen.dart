import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todos_porto_2/app_resources.dart';
import 'package:todos_porto_2/screens/login_screen.dart';
import 'package:todos_porto_2/widgets/custom_button.dart';
import 'package:todos_porto_2/widgets/custom_scaffold.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/imgs/onboarding_img.svg",
              width: getWidth(context, 50),
            ),
            SizedBox(
              height: getHeight(context, 10),
            ),
            Text(
              "Get things done with TODO's",
              style: boldText.copyWith(fontSize: 22),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 30),
              child: Text(
                "Stay organized, set reminders, and achieve your goals effortlessly. Get started now!",
                style: boldText,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: getHeight(context, 6),
            ),
            CustomButton(
              child: const Text(
                "Get Started",
                style: boldText,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
