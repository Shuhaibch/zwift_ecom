import 'package:ecommerce/commen/success/success_screen.dart';
import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/products/cart/coupon_widget.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
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
          onPressed: () => Get.to(() => SuccessScreen(
                image: CIMages.paymentSuccessTruck,
                title: 'Payment Success',
                subTitle: 'Items will be shipped soon',
                onPressed: () => Get.to(() => const NavigationMenu()),
              )),
          child: const Text('Checkout \$123'),
        ),
      ),
    );
  }
}
