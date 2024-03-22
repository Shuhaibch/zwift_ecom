
import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/products/product_card/product_card_vertical.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CSortableProduct extends StatelessWidget {
  const CSortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* Dropdown
        DropdownButtonFormField(
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: (value) {},
          decoration: const InputDecoration(
            icon: Icon(Iconsax.sort),
          ),
        ),
        const SizedBox(height: CSizes.spaceBtwSection),
        CGridLayout(
            itemCount: 8,
            itemBuilder: (_, index) => const CProductCardVertical())
      ],
    );
  }
}
