import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/appbar/tabbar.dart';
import 'package:ecommerce/commen/widgets/brand/brand_card.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/seach_container.dart';
import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/screens/brands/all_brands.dart';
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
    return DefaultTabController(
      length: 5,
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
                      CGridLayout(
                        mainAxisExtent: 88,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return CBrandCard(
                            showBorder: true,
                          );
                        },
                      )
                    ],
                  ),
                ),
                bottom: const CTabbar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Cloths')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              )
            ];
          },

          //* Tabbar Body
          body: const TabBarView(
            children: [
              CCategoryTab(),
              CCategoryTab(),
              CCategoryTab(),
              CCategoryTab(),
              CCategoryTab()
            ],
          ),
        ),
      ),
    );
  }
}
