import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/shop/screens/order/widgets/order_list.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* AppBar
      appBar: CAppbar(
          title: Text(
            'My Order',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(CSizes.defaultSpace),

        //* Order
        child: COrderListItems(),
      ),
    );
  }
}
