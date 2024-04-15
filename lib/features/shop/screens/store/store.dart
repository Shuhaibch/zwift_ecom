import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/appbar/tabbar.dart';
import 'package:ecommerce/commen/widgets/brand/brand_card.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/seach_container.dart';
import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce/commen/widgets/shimmer/brand_shimmer.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/catogory_controler.dart';
import 'package:ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:ecommerce/features/shop/screens/brands/all_brands.dart';
import 'package:ecommerce/features/shop/screens/brands/brand_product.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/catagory_tab.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: category.length,
      child: Scaffold(
        appBar: CAppbar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [
            CCartCounterIcon(),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: CHelperFuntions.isDarkMode(context)
                    ? CColors.blackColor
                    : CColors.whiteColor,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(CSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //* Search bar
                      const SizedBox(height: CSizes.spaceBtwItem),
                      const CSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsetsDirectional.zero,
                      ),
                      const SizedBox(height: CSizes.spaceBtwSection),
                      //* Featured Brand
                      CSectionHeading(
                        title: "Featured Brands",
                        onPressed: () => Get.to(() => const AllBrandScreen()),
                      ),
                      const SizedBox(height: CSizes.spaceBtwItem / 1.5),

                      //* featuredBrand Logo Details
                      Obx(() {
                        if (brandController.isLoading.value) {
                          return const CBrandShimmer(itemCount: 4);
                        }
                        if (brandController.featuredBrands.isEmpty) {
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
                          itemCount: brandController.featuredBrands.length,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return CBrandCard(
                              showBorder: true,
                              brand: brand,
                              onTap: () =>
                                  Get.to(() => BrandProducts(brand: brand)),
                            );
                          },
                        );
                      })
                    ],
                  ),
                ),
                bottom: CTabbar(
                    tabs: category
                        .map((element) => Tab(
                              child: Text(element.name),
                            ))
                        .toList()),
              )
            ];
          },

          //* Tabbar Body
          body: TabBarView(
              children: category
                  .map((element) => CCategoryTab(
                        category: element,
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
