

import 'package:ecommerce/commen/widgets/images/c_rounded_images.dart';
import 'package:ecommerce/commen/widgets/text/brand_title_with_verification_icon.dart';
import 'package:ecommerce/commen/widgets/text/product_title_text.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CCartItem extends StatelessWidget {
  const CCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //* Image
        CRoundedImage(
          // fit: BoxFit.fill,
          imageUrl: CIMages.productShoes,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(CSizes.md),
          backgroundColor: CHelperFuntions.isDarkMode(context)
              ? CColors.greyColor
              : CColors.lightColor,
        ),
        const SizedBox(width: CSizes.spaceBtwItem),
    
        //* Title, Price, Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CBrandTitleWithVerificationIcon(title: 'Nike'),
              const Flexible(
                child: CProductTitleText(
                    title: 'Black Shoprts Shoes', maxLine: 1),
              ),
    
              //* Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Color ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Red ',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: 'Size ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Uk 32 ',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
