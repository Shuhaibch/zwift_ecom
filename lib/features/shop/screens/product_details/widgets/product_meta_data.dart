import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/text/brand_title_with_verification_icon.dart';
import 'package:ecommerce/commen/widgets/text/product_price_text.dart';
import 'package:ecommerce/commen/widgets/text/product_title_text.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enum.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
// import 'package:ecommerce/util/helpers/helpe_functions.dart';
import 'package:flutter/material.dart';

class CProductMetaData extends StatelessWidget {
  const CProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = CHelperFuntions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* Price & Sales Price
        Row(
          children: [
            //* Sales Tag
            CRoundedContainer(
              radius: CSizes.sm,
              backgroundColor: CColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: CSizes.sm, vertical: CSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: CColors.blackColor),
              ),
            ),
            const SizedBox(width: CSizes.spaceBtwItem),

            // //* Price
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: CSizes.spaceBtwItem / 1.5),
            const CProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItem / 1.5),

        //* Title
        const CProductTitleText(title: 'Red Nike Sports Shoes'),
        const SizedBox(height: CSizes.spaceBtwItem / 1.5),

        //* Stoke Status
        Row(
          children: [
            const CProductTitleText(title: 'Status'),
            const SizedBox(width: CSizes.spaceBtwItem),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const SizedBox(width: CSizes.spaceBtwItem / 1.5),

        //* Brand
        const CBrandTitleWithVerificationIcon(
            title: 'Nike', brandTextSize: TextSizes.medium),
      ],
    );
  }
}
