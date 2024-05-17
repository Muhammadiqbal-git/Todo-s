import 'package:flutter/material.dart';
import 'package:todos_porto_2/theme.dart';

AppColors colors(context) => Theme.of(context).extension<AppColors>()!;

const TextStyle normalText =
    TextStyle(fontFamily: "Poppins", color: Colors.black);
const TextStyle italicText = TextStyle(
    fontFamily: "Poppins", fontStyle: FontStyle.italic, color: Colors.black);
const TextStyle boldText = TextStyle(
    fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.black);
const TextStyle semiBoldText = TextStyle(
    fontFamily: "Poppins", fontWeight: FontWeight.w500, color: Colors.black);

double getWidth(BuildContext context, int size) {
  return MediaQuery.of(context).size.width * (size / 100);
}

double getHeight(BuildContext context, int size) {
  return MediaQuery.of(context).size.height * (size / 100);
}
