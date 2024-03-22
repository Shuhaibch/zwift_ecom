import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/icons/c_curcular_icon.dart';
import 'package:ecommerce/commen/widgets/images/c_rounded_images.dart';
import 'package:ecommerce/commen/widgets/text/brand_title_with_verification_icon.dart';
import 'package:ecommerce/commen/widgets/text/product_price_text.dart';
import 'package:ecommerce/commen/widgets/text/product_title_text.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CProductCardHorizontal extends StatelessWidget {
  const CProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        // boxShadow: [CShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(CSizes.productImageRadius),
        color: dark ? CColors.darkerGreyColor : CColors.lightContainerColor,
      ),
      child: Row(
        children: [
          //* Thumbnail
          CRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(CSizes.sm),
            backgroundColor: dark ? CColors.darkColor : CColors.lightColor,
            child: Stack(
              children: [
                //* Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: CRoundedImage(
                      imageUrl: CIMages.productShoes, applyImageRadius: true),
                ),

                //* Sale Tag
                Positioned(
                  top: 12,
                  child: CRoundedContainer(
                    radius: CSizes.sm,
                    backgroundColor: CColors.secondaryColor.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: CSizes.sm, vertical: CSizes.sm),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: CColors.blackColor),
                    ),
                  ),
                ),

                //* Favorite Icon button
                const Positioned(
                  right: 0,
                  top: 0,
                  child: CCircularIcon(
                    
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ), //* Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: CSizes.sm, left: CSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CProductTitleText(
                        title: "Red Nike Sports Shoes",
                        smallSize: true,
                      ),
                      SizedBox(height: CSizes.spaceBtwItem / 2),
                      CBrandTitleWithVerificationIcon(title: 'Nike')
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: CProductPriceText(price: '256.1')),

                      //* Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: CColors.darkColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(CSizes.cardRadiusMd),
                            bottomRight: Radius.circular(CSizes.cardRadiusMd),
                          ),
                        ),
                        child: const SizedBox(
                          width: CSizes.iconLg * 1.2,
                          height: CSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: CColors.whiteColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
