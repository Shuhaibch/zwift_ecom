import 'package:ecommerce/commen/widgets/icons/c_curcular_icon.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CProductQuantityWithAddOrRemoveButton extends StatelessWidget {
  const CProductQuantityWithAddOrRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });
  final int quantity;
  final VoidCallback? add, remove;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CCircularIcon(
          onPressed: quantity > 0 ? remove : null,
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: CSizes.md,
          color: CHelperFuntions.isDarkMode(context)
              ? CColors.whiteColor
              : CColors.blackColor,
          backgroundColor: CHelperFuntions.isDarkMode(context)
              ? CColors.darkerGreyColor
              : CColors.lightColor,
        ),
        const SizedBox(width: CSizes.spaceBtwItem),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: CSizes.spaceBtwItem),
        CCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: CSizes.md,
          color: CColors.whiteColor,
          backgroundColor: CColors.primaryColor,
          onPressed: add,
        ),
      ],
    );
  }
}
