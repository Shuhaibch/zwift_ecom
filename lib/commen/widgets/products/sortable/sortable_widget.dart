import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/products/product_card/product_card_vertical.dart';
import 'package:ecommerce/features/shop/controllers/product/all_product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CSortableProduct extends StatelessWidget {
  const CSortableProduct({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AlProductController());
    controller.assignProduct(products);
    return Column(
      children: [
        //* Dropdown
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
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
          onChanged: (value) {
            // sort product based on the value
            controller.sortProduct(value!);
          },
          decoration: const InputDecoration(
            icon: Icon(Iconsax.sort),
          ),
        ),
        const SizedBox(height: CSizes.spaceBtwSection),
        Obx(
          () => CGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => CProductCardVertical(
                    product: controller.products[index],
                  )),
        )
      ],
    );
  }
}
