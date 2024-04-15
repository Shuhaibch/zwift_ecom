import 'package:ecommerce/commen/widgets/icons/c_curcular_icon.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CBottomAddToCart extends StatelessWidget {
  const CBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CSizes.defaultSpace, vertical: CSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? CColors.darkerGreyColor : CColors.lightColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CSizes.cardRadiusLg),
          topRight: Radius.circular(CSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CCircularIcon(
                icon: Iconsax.minus_copy,
                backgroundColor: CColors.darkGreyColor,
                width: 40,
                height: 40,
                color: CColors.whiteColor,
              ),
              const SizedBox(width: CSizes.spaceBtwItem),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: CSizes.spaceBtwItem),
              const CCircularIcon(
                icon: Iconsax.add_copy,
                backgroundColor: CColors.blackColor,
                width: 40,
                height: 40,
                color: CColors.whiteColor,
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(CSizes.md),
              backgroundColor: CColors.blackColor,
              side: const BorderSide(
                color: CColors.blackColor,
              ),
            ),
            onPressed: () {},
            child: const Text("Add to Cart"),
          )
        ],
      ),
    );
  }
}
