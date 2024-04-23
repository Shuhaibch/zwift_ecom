import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCartAddToCartButton extends StatelessWidget {
  const ProductCartAddToCartButton({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // if product have variation then shaw the product Details for variation selection.
        // Else add product to cart
      },
      child: Container(
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
      ),
    );
  }
}
