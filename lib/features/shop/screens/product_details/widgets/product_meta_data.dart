import 'package:flutter/material.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/images/c_circular_image.dart';
import 'package:ecommerce/commen/widgets/text/brand_title_with_verification_icon.dart';
import 'package:ecommerce/commen/widgets/text/product_price_text.dart';
import 'package:ecommerce/commen/widgets/text/product_title_text.dart';
import 'package:ecommerce/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enum.dart';
import 'package:ecommerce/utils/constants/sizes.dart';

class CProductMetaData extends StatelessWidget {
  const CProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
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
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: CColors.blackColor),
              ),
            ),
            const SizedBox(width: CSizes.spaceBtwItem),

            //* Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text('\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: CSizes.spaceBtwItem / 1.5),
            CProductPriceText(
                price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItem / 1.5),

        //* Title
        CProductTitleText(title: product.title),
        const SizedBox(height: CSizes.spaceBtwItem / 1.5),

        //* Stoke Status
        Row(
          children: [
            const CProductTitleText(title: 'Status'),
            const SizedBox(width: CSizes.spaceBtwItem),
            Text(controller.getProductStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const SizedBox(width: CSizes.spaceBtwItem / 1.5),

        //* Brand
        Row(
          children: [
            CCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              isNetworkImage: true,
            ),
            Expanded(
              child: CBrandTitleWithVerificationIcon(
                  title: product.brand!.name,
                  brandTextSize: TextSizes.medium),
            ),
          ],
        ),],
    );
  }
}
