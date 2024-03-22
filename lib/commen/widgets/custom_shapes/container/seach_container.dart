import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CSearchContainer extends StatelessWidget {
  const CSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: CDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(CSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? CColors.darkColor
                      : CColors.whiteColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(CSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: CColors.greyColor) : null),
          child: Row(
            children: [
              Icon(
                icon,
                color: CColors.darkerGreyColor,
              ),
              const SizedBox(
                width: CSizes.spaceBtwItem,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
