import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: CAppbar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),

      body: Obx(
        () {
          // Nothing found widget
          final emptyWidget = CAnimationLoaderWidget(
            text: 'Whoops! Cart is EMPTY.',
            animation: CIMages.emptyWhishlistLotties,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(
              () => const NavigationMenu(),
            ),
          );
          if (controller.cartItem.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(CSizes.defaultSpace),
                child: CCartItems(),
              ),
            );
          }
        },
      ),

      //* Bottom Navigation Checkout button
      bottomNavigationBar: controller.cartItem.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() =>
                    Text('Checkout \$${controller.totalCartPrice.value}')),
              ),
            ),
    );
  }
}
