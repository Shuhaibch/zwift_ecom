import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CChipTheme {
  CChipTheme._();

  //? light chip theme
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: CColors.greyColor.withOpacity(.4),
    labelStyle: const TextStyle(
      color: CColors.blackColor,
    ),
    selectedColor: CColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: CColors.whiteColor,
  );

  //? dark chip theme
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: CColors.darkerGreyColor,
    labelStyle: TextStyle(
      color: CColors.whiteColor,
    ),
    selectedColor: CColors.primaryColor,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );
}
