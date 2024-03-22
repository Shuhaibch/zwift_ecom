import 'package:ecommerce/commen/widgets/brand/brand_show_case.dart';
import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/products/product_card/product_card_vertical.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CCategoryTab extends StatelessWidget {
  const CCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              //* Brand
              const CBrandShowCase(
                images: [
                  CIMages.productShoes,
                  CIMages.productShoes2,
                  CIMages.productWatch2
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwItem),

              //* Products
              CSectionHeading(title: 'You might like', onPressed: () {}),
              const SizedBox(height: CSizes.spaceBtwItem),

              //* like Product List
              CGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const CProductCardVertical(),
              ),
              const SizedBox(height: CSizes.spaceBtwSection),
            ],
          ),
        ),
      ],
    );
  }
}
