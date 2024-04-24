import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/product_details/porduct_details.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enum.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCartAddToCartButton extends StatelessWidget {
  const ProductCartAddToCartButton({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        // if product have variation then shaw the product Details for variation selection.
        // Else add product to cart
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailsScreen(product: product));
        }
      },
      child: Obx(
        () {
          final productQunatityInCart =
              cartController.getProductQuantityinCart(product.id);
          return Container(
            decoration: BoxDecoration(
              color: productQunatityInCart > 0
                  ? CColors.primaryColor
                  : CColors.darkColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(CSizes.cardRadiusMd),
                bottomRight: Radius.circular(CSizes.cardRadiusMd),
              ),
            ),
            child: SizedBox(
              width: CSizes.iconLg * 1.2,
              height: CSizes.iconLg * 1.2,
              child: Center(
                child: productQunatityInCart > 0
                    ? Text(
                        productQunatityInCart.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: CColors.whiteColor),
                      )
                    : const Icon(
                        Iconsax.add,
                        color: CColors.whiteColor,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
