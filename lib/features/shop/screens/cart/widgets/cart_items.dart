import 'package:ecommerce/commen/widgets/products/cart/add_or_remove_button.dart';
import 'package:ecommerce/commen/widgets/products/cart/cart_item.dart';
import 'package:ecommerce/commen/widgets/text/product_price_text.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CCartItems extends StatelessWidget {
  const CCartItems({super.key, this.showAddRemoveButton = true});
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: CSizes.spaceBtwSection),
      itemCount: 2,
      itemBuilder: (_, index) {
        return Column(
          children: [
            const CCartItem(),
            if (showAddRemoveButton)
              const SizedBox(height: CSizes.spaceBtwItem),
            if (showAddRemoveButton)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      //* Extra space to align with picture
                      SizedBox(width: 70),

                      //* Add Remove Button
                      CProductQuantityWithAddOrRemoveButton(),
                    ],
                  ),

                  //* Product Total Price
                  CProductPriceText(
                    price: '123',
                  ),
                ],
              )
          ],
        );
      },
    );
  }
}
