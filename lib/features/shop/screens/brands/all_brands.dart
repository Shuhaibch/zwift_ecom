import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/brand/brand_card.dart';
import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/shimmer/brand_shimmer.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:ecommerce/features/shop/screens/brands/brand_product.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
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
            Obx(() {
              if (controller.isLoading.value) {
                return const CBrandShimmer(itemCount: 4);
              }
              if (controller.allBrand.isEmpty) {
                return Center(
                    child: Text(
                  'No Data Found!',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: CColors.whiteColor),
                ));
              }
              return CGridLayout(
                mainAxisExtent: 88,
                itemCount: controller.allBrand.length,
                itemBuilder: (_, index) {
                  final brand = controller.allBrand[index];
                  return CBrandCard(
                    showBorder: true,
                    brand: brand,
                    onTap: () => Get.to(() => BrandProducts(brand: brand)),
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
