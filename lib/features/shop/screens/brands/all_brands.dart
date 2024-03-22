import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/brand/brand_card.dart';
import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/screens/brands/brand_product.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppbar(
          title: Text(
            'Brand',
          ),
          showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          children: [
            //* Heading
            const CSectionHeading(
              title: 'Brands',
              showActionButton: false,
            ),
            const SizedBox(height: CSizes.spaceBtwItem),

            //* Brands
            CGridLayout(
              mainAxisExtent: 80,
              itemCount: 10,
              itemBuilder: (context, index) => CBrandCard(
                showBorder: true,
                onTap: () => Get.to(() => const BrandProducts()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
