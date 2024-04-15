import 'package:ecommerce/commen/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/seach_container.dart';
import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/products/product_card/product_card_vertical.dart';
import 'package:ecommerce/commen/widgets/shimmer/vertival_product_shimmer.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/c_promo_slider.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_catagories.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* Header of Home screen
            const CPrimaryHeaderContainer(
              child: Column(
                children: [
                  //* Custum app bar
                  CHomeAppbar(),
                  SizedBox(
                    height: CSizes.spaceBtwSection,
                  ),

                  //* search bar
                  CSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: CSizes.spaceBtwSection,
                  ),

                  //* Catagories
                  Padding(
                    padding: EdgeInsets.only(left: CSizes.defaultSpace),
                    child: Column(
                      children: [
                        //* Heading
                        CSectionHeading(
                          title: "Popular Catagories",
                          showActionButton: false,
                          textColor: CColors.whiteColor,
                        ),
                        SizedBox(
                          height: CSizes.spaceBtwItem,
                        ),

                        //* Catagories
                        CHomeCatagories(),
                        SizedBox(
                          height: CSizes.spaceBtwSection,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            //* body

            Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  //* Promo Slider
                  const CPromoSlider(),
                  const SizedBox(
                    height: CSizes.spaceBtwSection,
                  ),

                  //* Heading
                  CSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProductScreen(
                          title: 'Popular Products',
                          // query: FirebaseFirestore.instance.collection('Products').where('IsFeatured', isEqualTo: true).limit(6),
                          futureMethod: controller.fetchAllFeaturedProduct(),
                        )),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItem),

                  //* Popular Product ProductCard  Vertical
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const SizedBox(
                          height: 100, child: CVerticalProductShimmer());
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found!',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return CGridLayout(
                      itemBuilder: (_, index) => CProductCardVertical(
                        product: controller.featuredProducts[index],
                      ),
                      itemCount: controller.featuredProducts.length,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
