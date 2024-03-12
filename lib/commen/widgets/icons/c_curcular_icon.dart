import 'package:ecommerce/util/constants/colors.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/helpers/helpe_functions.dart';
import 'package:flutter/material.dart';

class CCircularIcon extends StatelessWidget {
  const CCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = CSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : dark
                ? CColors.blackColor.withOpacity(.9)
                : CColors.whiteColor.withOpacity(0.9),
      ),
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
