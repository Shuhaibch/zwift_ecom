import 'package:ecommerce/util/constants/colors.dart';
import 'package:flutter/material.dart';

class CShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: CColors.darkGreyColor.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: CColors.darkGreyColor.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
