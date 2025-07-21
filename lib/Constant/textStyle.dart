import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  final BuildContext context;
  final double _scale;

  AppTextStyles(this.context)
      : _scale = MediaQuery.of(context).size.width / 375;

  TextStyle get headingLarge => GoogleFonts.raleway(
    fontSize: 29 * _scale,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  TextStyle get headingMedium => GoogleFonts.raleway(
    fontSize: 20 * _scale,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  TextStyle get bodyRegular => GoogleFonts.raleway(
    fontSize: 13.33 * _scale,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  TextStyle get bodyLight => GoogleFonts.raleway(
    fontSize: 13 * _scale,
    fontWeight: FontWeight.w300,
    color: AppColors.textSecondary,
  );

  TextStyle get buttonText => GoogleFonts.raleway(
    fontSize: 16 * _scale,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
  );

  TextStyle get caption => GoogleFonts.raleway(
    fontSize: 11.11 * _scale,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  TextStyle get link => GoogleFonts.raleway(
    fontSize: 13 * _scale,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );
}
