import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primaryCr;
  final Color secondaryCr;
  final Color backgroundCr;
  final Color whiteCr;

  const AppColors({
    required this.primaryCr,
    required this.secondaryCr,
    required this.backgroundCr,
    required this.whiteCr,
  });

  @override
  AppColors copyWith({
    Color? primaryCr,
    Color? secondaryCr,
    Color? backgroundCr,
    Color? whiteCr,
  }) {
    return AppColors(
      primaryCr: primaryCr ?? this.primaryCr,
      secondaryCr: secondaryCr ?? this.secondaryCr,
      backgroundCr: backgroundCr ?? this.backgroundCr,
      whiteCr: whiteCr ?? this.whiteCr,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryCr: Color.lerp(primaryCr, other.primaryCr, t)!,
      secondaryCr: Color.lerp(secondaryCr, other.secondaryCr, t)!,
      backgroundCr: Color.lerp(backgroundCr, other.backgroundCr, t)!,
      whiteCr: Color.lerp(whiteCr, other.whiteCr, t)!,
    );
  }
}
