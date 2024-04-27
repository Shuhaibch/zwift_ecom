import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/pricing_calculater.dart';
import 'package:flutter/material.dart';

class CBillingAmountSection extends StatelessWidget {
  const CBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        //* SubTotol
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItem / 2),

        //* Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                '\$${CPricingCalculator.calculateShippingCost(subTotal, 'US')}',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        //* Tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                '\$${CPricingCalculator.calculateTax(subTotal, 'US')}',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItem / 2),

        //* Total Order
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Oder', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                '\$${CPricingCalculator.calculateTotalPrice(subTotal, 'US')}',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        )
      ],
    );
  }
}
