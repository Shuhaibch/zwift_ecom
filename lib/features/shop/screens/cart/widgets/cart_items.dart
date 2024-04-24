import 'package:ecommerce/commen/widgets/products/cart/add_or_remove_button.dart';
import 'package:ecommerce/commen/widgets/products/cart/cart_item.dart';
import 'package:ecommerce/commen/widgets/text/product_price_text.dart';
import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CCartItems extends StatelessWidget {
  const CCartItems({super.key, this.showAddRemoveButton = true});
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) =>
            const SizedBox(height: CSizes.spaceBtwSection),
        itemCount: cartController.cartItem.length,
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItem[index];
          return Column(
            children: [
              CCartItem(cartItem: item),
              if (showAddRemoveButton)
                const SizedBox(height: CSizes.spaceBtwItem),
              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //* Extra space to align with picture
                        const SizedBox(width: 70),

                        //* Add Remove Button
                        CProductQuantityWithAddOrRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),

                    //* Product Total Price
                    CProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}
