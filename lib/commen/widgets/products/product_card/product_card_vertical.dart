import 'package:ecommerce/commen/styles/shadow.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/images/c_rounded_images.dart';
import 'package:ecommerce/commen/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:ecommerce/commen/widgets/products/product_card/product_card_vertical_addtocart.dart';
import 'package:ecommerce/commen/widgets/text/brand_title_with_verification_icon.dart';
import 'package:ecommerce/commen/widgets/text/product_title_text.dart';
import 'package:ecommerce/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/product_details/porduct_details.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enum.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../text/product_price_text.dart';

class CProductCardVertical extends StatelessWidget {
  const CProductCardVertical({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
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
              width: 180,
              height: 180,
              padding: const EdgeInsets.all(CSizes.sm),
              backgroundColor: dark ? CColors.darkColor : CColors.lightColor,
              child: Stack(
                children: [
                  //* Thumbnail Image
                  Center(
                    child: CRoundedImage(
                        imageUrl: product.thumbnail,
                        applyImageRadius: true,
                        isNetworkImage: true),
                  ),

                  //* Sale Tag
                  if (salePercentage != null || salePercentage != '0')
                    Positioned(
                      top: 12,
                      child: CRoundedContainer(
                        radius: CSizes.sm,
                        backgroundColor:
                            CColors.secondaryColor.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: CSizes.sm, vertical: CSizes.sm),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: CColors.blackColor),
                        ),
                      ),
                    ),

                  //* Favorite Icon button
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CFavoriteIcon(productId: product.id,),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: CSizes.spaceBtwItem / 2,
            ),
            //*  Details
            Padding(
              padding: const EdgeInsets.only(left: CSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: CSizes.spaceBtwItem / 2),
                  CBrandTitleWithVerificationIcon(
                      brand: product.brand ?? BrandModel.empty()),
                ],
              ),
            ),
            const Spacer(),

            //* Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0.00)
                        Padding(
                            padding: const EdgeInsets.only(left: CSizes.sm),
                            child: Text(
                              product.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            )),

                      // Show sale price as main price if sale exist
                      Padding(
                        padding: const EdgeInsets.only(left: CSizes.sm),
                        child: CProductPriceText(
                          price: product.salePrice.toString(),
                        ),
                      ),
                    ],
                  ),
                ),

                //* Add to cart
                 ProductCartAddToCartButton(product: product)
              ],
            )
          ],
        ),
      ),
    );
  }
}

