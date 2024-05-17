import 'package:flutter/material.dart';
import 'package:todos_porto_2/app_resources.dart';
import 'package:todos_porto_2/theme.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Color? leafColor;
  final Color? backgroundColor;
  final PreferredSizeWidget? appbar;
  final EdgeInsets? padding;

  const CustomScaffold(
      {super.key,
      required this.body,
      this.backgroundColor,
      this.leafColor,
      this.appbar,
      this.padding});

  AppColors colors(context) => Theme.of(context).extension<AppColors>()!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? colors(context).backgroundCr,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -(getWidth(context, 52) / 2),
            left: -(getWidth(context, 52) /
                getWidth(context, 10)),
            child: Container(
              width: getWidth(context, 52),
              height: getWidth(context, 52),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: leafColor ?? colors(context).primaryCr.withOpacity(0.25),
              ),
            ),
          ),
          Positioned(
            top: -(getWidth(context, 52) /
                getWidth(context, 1)),
            left: -(getWidth(context, 52) / 3),
            child: Container(
              width: getWidth(context, 52),
              height: getWidth(context, 52),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: leafColor ?? colors(context).primaryCr.withOpacity(0.25),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 0 + (appbar?.preferredSize.height ?? 0)),
              child: body
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: appbar ?? const SizedBox.shrink()
          ),
        ],
      ),
    );
  }
}
