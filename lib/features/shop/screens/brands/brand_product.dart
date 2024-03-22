import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/brand/brand_card.dart';
import 'package:ecommerce/commen/widgets/products/sortable/sortable_widget.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CAppbar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              //* Brand Details
              CBrandCard(showBorder: true),
              SizedBox(height: CSizes.spaceBtwSection),
              CSortableProduct()
            ],
          ),
        ),
      ),
    );
  }
}
