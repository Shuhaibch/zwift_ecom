import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/icons/c_curcular_icon.dart';
import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/products/product_card/product_card_vertical.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar(
        title: Text('Whishlist',
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CCircularIcon(
            icon: Iconsax.add,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              CGridLayout(
                itemCount: 6,
                itemBuilder: (_, index) => CProductCardVertical(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
