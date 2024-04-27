import 'package:ecommerce/commen/widgets/icons/c_curcular_icon.dart';
import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CBottomAddToCart extends StatelessWidget {
  const CBottomAddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = CHelperFuntions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CSizes.defaultSpace, vertical: CSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? CColors.darkerGreyColor : CColors.lightColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CSizes.cardRadiusLg),
          topRight: Radius.circular(CSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //* Remove item button
            Row(
              children: [
                CCircularIcon(
                    icon: Iconsax.minus_copy,
                    backgroundColor: CColors.darkGreyColor,
                    width: 40,
                    height: 40,
                    color: CColors.whiteColor,
                    onPressed: () => controller.productQuantityInCart > 0
                        ? controller.productQuantityInCart.value -= 1
                        : null),
                const SizedBox(width: CSizes.spaceBtwItem),
                Text(controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: CSizes.spaceBtwItem),
                CCircularIcon(
                  icon: Iconsax.add_copy,
                  backgroundColor: CColors.blackColor,
                  width: 40,
                  height: 40,
                  color: CColors.whiteColor,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(CSizes.md),
                backgroundColor: CColors.blackColor,
                side: const BorderSide(
                  color: CColors.blackColor,
                ),
              ),
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              child: controller.productQuantityInCart.value < 1
                  ? const Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.black38),
                    )
                  : const Text("Add to Cart"),
            )
          ],
        ),
      ),
    );
  }
}
