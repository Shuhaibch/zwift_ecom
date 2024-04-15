import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/products/product_card/product_card_vertical.dart';
import 'package:ecommerce/commen/widgets/shimmer/vertival_product_shimmer.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/catogory_controler.dart';
import 'package:ecommerce/features/shop/models/catagory_model.dart';
import 'package:ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/category_brands.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CCategoryTab extends StatelessWidget {
  const CCategoryTab({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              //* Brand
              CategoryBrand(category: category),
              const SizedBox(height: CSizes.spaceBtwItem),

              //* Products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    //* error handling
                    final response = CCloudHelperFuntion.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: const CVerticalProductShimmer(),
                    );
                    if (response != null) return response;

                    //* get data
                    final products = snapshot.data!;
                    return Column(
                      children: [
                        CSectionHeading(
                            title: 'You might like', onPressed: () => Get.to(()=> AllProductScreen(title: category.name, futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),))),
                        const SizedBox(height: CSizes.spaceBtwItem),

                        //* like Product List
                        CGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => CProductCardVertical(
                            product: products[index],
                          ),
                        ),
                      ],
                    );
                  }),

              const SizedBox(height: CSizes.spaceBtwSection),
            ],
          ),
        ),
      ],
    );
  }
}
// const CBrandShowCase(
//                 images: [
//                   CIMages.productShoes,
//                   CIMages.productShoes2,
//                   CIMages.productWatch2
//                 ],
//                 brand: ,
//               ),
