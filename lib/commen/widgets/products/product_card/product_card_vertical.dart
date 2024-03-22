import 'package:ecommerce/commen/styles/shadow.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/icons/c_curcular_icon.dart';
import 'package:ecommerce/commen/widgets/images/c_rounded_images.dart';
import 'package:ecommerce/commen/widgets/text/brand_title_with_verification_icon.dart';
import 'package:ecommerce/commen/widgets/text/product_title_text.dart';
import 'package:ecommerce/features/shop/screens/product_details/porduct_details.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../text/product_price_text.dart';

class CProductCardVertical extends StatelessWidget {
  const CProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailsScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(CSizes.productImageRadius),
          color: dark ? CColors.darkerGreyColor : CColors.whiteColor,
        ),
        child: Column(
          children: [
            //* Thumbnail , whislist Button, Discount tag
            CRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(CSizes.sm),
              backgroundColor: dark ? CColors.darkColor : CColors.lightColor,
              child: Stack(
                children: [
                  //* Thumbnail Image
                  const CRoundedImage(
                      imageUrl: CIMages.productShoes, applyImageRadius: true),

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
                            .labelLarge!
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
                  )
                ],
              ),
            ),
            const SizedBox(
              height: CSizes.spaceBtwItem / 2,
            ),
            //*  Details
            const Padding(
              padding: EdgeInsets.only(left: CSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CProductTitleText(
                      title: "Red Nike Air Shoes", smallSize: true),
                  SizedBox(height: CSizes.spaceBtwItem / 2),
                  CBrandTitleWithVerificationIcon(title: 'Nike'),
                ],
              ),
            ),
            const Spacer(),

            //* Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* Price
                const Padding(
                  padding: EdgeInsets.only(left: CSizes.sm),
                  child: CProductPriceText(
                    price: '35.0',
                  ),
                ),

                //* Add to cart
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
    );
  }
}
