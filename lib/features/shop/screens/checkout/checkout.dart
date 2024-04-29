import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/products/cart/coupon_widget.dart';
import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/order_controller.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/utils/helpers/pricing_calculater.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());
    final subTotal = cartController.totalCartPrice.value;
    final totalAmount = CPricingCalculator.calculateTotalPrice(subTotal, "US");

    return Scaffold(
      appBar: CAppbar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              //* Items in Cart
              const CCartItems(showAddRemoveButton: false),
              const SizedBox(height: CSizes.spaceBtwSection),

              //* Coupon TextFeild
              const CCuponCode(),
              const SizedBox(height: CSizes.spaceBtwSection),

              //* Billing Section
              CRoundedContainer(
                padding: const EdgeInsets.all(CSizes.md),
                showBorder: true,
                backgroundColor: dark ? CColors.blackColor : CColors.whiteColor,
                child: const Column(
                  children: [
                    //* Pricing
                    CBillingAmountSection(),
                    SizedBox(height: CSizes.spaceBtwItem),

                    //* Devider
                    Divider(),
                    SizedBox(height: CSizes.spaceBtwItem),

                    //* Payment Methords
                    CBillingPaymentSection(),
                    SizedBox(height: CSizes.spaceBtwItem),

                    //* Shipping Address
                    CBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      //* Bottom Navigation
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0
              ? () => orderController.processOrder(totalAmount)
              : () => CLoaders.warnigSnackBar(
                  title: 'Empty Cart', message: 'Add item in cart'),
          child: Text(
              'Checkout \$${CPricingCalculator.calculateTotalPrice(subTotal, 'US')}'),
        ),
      ),
    );
  }
}
