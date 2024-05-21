import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todos_porto_2/app_resources.dart';
import 'package:todos_porto_2/screens/login_screen.dart';
import 'package:todos_porto_2/widgets/custom_button.dart';
import 'package:todos_porto_2/widgets/custom_scaffold.dart';



class SplashScreens extends StatelessWidget {
  const SplashScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
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
                style: boldText.copyWith(fontSize: 20), textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                child: Text(
                  "Stay organized, set reminders, and achieve your goals effortlessly. Get started now!",
                  style: semiBoldText,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: getHeight(context, 6),
              ),
              CustomButton(
                child: Text(
                  "Get Started",
                  style: boldText.copyWith(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
