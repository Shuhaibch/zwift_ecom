import 'package:flutter/material.dart';

class CColors {
  CColors._();

  //* App Basic Color
  static const Color primaryColor = Color(0xFF4b68ff);
  static const Color secondaryColor = Color(0xFFFFE24B);
  static const Color accentColor = Color(0xFFb0c7ff);

  //* Gradient Colors
  static const Gradient linearGradient = LinearGradient(
  begin: Alignment(0, 0),
  end: Alignment(.707, -.707),
    colors: [
      Color(0xFFff9a9e),
      Color(0xFFfad0c4),
      Color(0xFFfad0c4),
    ],
  );

  //* Text Color
  static const Color textPrimaryColor = Color(0xFF333333);
  static const Color textSecondaryColor = Color(0xFF6c7570);
  static const Color textWhiteColor = Colors.white;

  //* Background Color
  static const Color lightColor = Color(0xFFF6F6F6);
  static const Color darkColor = Color(0xFF272727);
  static const Color primaryBackgroundColor = Color(0xFFF3f5FF);

  //* Border Color
  static const Color borderPrimaryColor = Color(0xFFD9D9D9);
  static const Color borderSecondaryColor = Color(0xFFE6E6E6);

  //* backgroud Container Color
  static const Color lightContainerColor = Color(0xFFF6F6F6);
  static Color darkContainerColor = Colors.white.withOpacity(0.1);

  //*Button Colors
  static const Color buttonprimaryColor = Color(0xFF4b68ff);
  static const Color buttonSecondaryColor = Color(0xFF6C7570);
  static const Color buttonDesabled = Color(0xFFC4c4c4);

  //*Error Validation Colors
  static const Color errorColor = Color(0xFFD32F2f);
  static const Color successColor = Color(0xFF388E3C);
  static const Color warningColor = Color(0xFFF57c00);
  static const Color infoColor = Color(0xFF1976D2);

  //*Nutral Shades
  static const Color blackColor = Color(0xFF232323);
  static const Color darkerGreyColor = Color(0xFF4F4F4F);
  static const Color darkGreyColor = Color(0xFF939393);
  static const Color greyColor = Color(0xFFE0E0E0);
  static const Color softGreyColor = Color(0xFFF4F4F4);
  static const Color lightGreyColor = Color(0xFFF9F9F9);
  static const Color whiteColor = Color(0xFFFFFFFF);
}
