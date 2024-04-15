import 'package:ecommerce/utils/theme/custum_theme/app_bar_theme.dart';
import 'package:ecommerce/utils/theme/custum_theme/bottom_sheet_theme.dart';
import 'package:ecommerce/utils/theme/custum_theme/check_box_theme.dart';
import 'package:ecommerce/utils/theme/custum_theme/chip_theme.dart';
import 'package:ecommerce/utils/theme/custum_theme/elevated_button_theme.dart';
import 'package:ecommerce/utils/theme/custum_theme/outlined_button_theme.dart';
import 'package:ecommerce/utils/theme/custum_theme/text_feild_theme.dart';
import 'package:ecommerce/utils/theme/custum_theme/text_theme.dart';
import 'package:flutter/material.dart';

class CAppTheme {
  CAppTheme._();

  //? light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CTextTheme.lightTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    chipTheme: CChipTheme.lightChipTheme,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
    checkboxTheme: CCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: CBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: COutLinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CTextFeildTheme.lightInputDecarationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    // primarySwatch: Colors.blue,
    textTheme: CTextTheme.dartTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    chipTheme: CChipTheme.darkChipTheme,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    checkboxTheme: CCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: CBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: COutLinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CTextFeildTheme.darkInputDecarationTheme,
  );
}
