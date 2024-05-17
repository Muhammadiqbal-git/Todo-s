import 'package:flutter/material.dart';
import 'package:todos_porto_2/app_resources.dart';
import 'package:todos_porto_2/theme.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;

  const CustomButton({
    super.key, required this.child, required this.onPressed, this.width, this.height, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      height: height ?? 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? colors(context).primaryCr,
        borderRadius: BorderRadius.circular(5)
      ),
      child: TextButton(
        onPressed: onPressed,
        child: child),
    );
  }
}
