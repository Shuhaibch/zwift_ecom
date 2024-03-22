import 'package:ecommerce/features/shop/screens/cart/cart_screen.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CCartCounterIcon extends StatelessWidget {
  const CCartCounterIcon({
    super.key,
    this.iconColor,
    // required this.onPressed,
  });
  final Color? iconColor;
  // final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: ()=> Get.to(()=>const CartScreen() ),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: CColors.blackColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  '2',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: CColors.whiteColor, fontSizeFactor: 0.8),
                ),
              ),
            ))
      ],
    );
  }
}
