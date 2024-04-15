import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/images/c_rounded_images.dart';
import 'package:ecommerce/commen/widgets/products/product_card/product_card_horizontal.dart';
import 'package:ecommerce/commen/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/catogory_controler.dart';
import 'package:ecommerce/features/shop/models/catagory_model.dart';
import 'package:ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: CAppbar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              //* Banner
              const CRoundedImage(
                  imageUrl: CIMages.promoBanner1,
                  width: double.infinity,
                  applyImageRadius: true),
              const SizedBox(height: CSizes.spaceBtwSection),

              //* sub-catagories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    // error handling
                    const loader = CHorizontalProductShimmer();
                    final widget = CCloudHelperFuntion.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;

                    // record found
                    final subCategories = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                          future: controller.getCategoryProducts(
                              categoryId: subCategory.id),
                          builder: (context, snapshot) {
                            final widget =
                                CCloudHelperFuntion.checkMultiRecordState(
                                    snapshot: snapshot, loader: loader);

                            if (widget != null) return widget;

                            // record found
                            final products = snapshot.data!;

                            return Column(
                              children: [
                                //* Heading
                                CSectionHeading(
                                  title: subCategory.name,
                                  onPressed: () => Get.to(
                                    (
                                      () => AllProductScreen(
                                            title: subCategory.name,
                                            futureMethod:
                                                controller.getCategoryProducts(
                                              categoryId: subCategory.id,
                                              limit: -1,
                                            ),
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: CSizes.spaceBtwItem / 2),
                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    itemCount: products.length,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                            width: CSizes.spaceBtwItem),
                                    itemBuilder: (context, index) =>
                                        CProductCardHorizontal(
                                      product: products[index],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: CSizes.spaceBtwSection)
                              ],
                            );
                          },
                        );
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
