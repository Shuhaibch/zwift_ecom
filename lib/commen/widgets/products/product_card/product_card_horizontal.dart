import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/images/c_rounded_images.dart';
import 'package:ecommerce/commen/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:ecommerce/commen/widgets/text/brand_title_with_verification_icon.dart';
import 'package:ecommerce/commen/widgets/text/product_price_text.dart';
import 'package:ecommerce/commen/widgets/text/product_title_text.dart';
import 'package:ecommerce/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/enum.dart';

class CProductCardHorizontal extends StatelessWidget {
  const CProductCardHorizontal({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

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
                SizedBox(
                  height: 120,
                  width: 120,
                  child: CRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true),
                ),

                //* Sale Tag
                if (salePercentage != null)
                  Positioned(
                    top: 12,
                    child: CRoundedContainer(
                      radius: CSizes.sm,
                      backgroundColor: CColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: CSizes.sm, vertical: CSizes.sm),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: CColors.blackColor),
                      ),
                    ),
                  ),

                //* Favorite Icon button
                Positioned(
                  right: 0,
                  top: 0,
                  child: CFavoriteIcon(
                    productId: product.id,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CProductTitleText(
                        title: product.title,
                        smallSize: true,
                      ),
                      const SizedBox(height: CSizes.spaceBtwItem / 2),
                      CBrandTitleWithVerificationIcon(
                        title: product.brand!.name,
                      )
                    ],
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
                                  padding:
                                      const EdgeInsets.only(left: CSizes.sm),
                                  child: Text(
                                    product.price.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
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
