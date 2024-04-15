import 'package:ecommerce/commen/widgets/brand/brand_show_case.dart';
import 'package:ecommerce/commen/widgets/shimmer/box_shimmer.dart';
import 'package:ecommerce/commen/widgets/shimmer/list_tile_shimmer.dart';
import 'package:ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:ecommerce/features/shop/models/catagory_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandForCategory(category.id),
        builder: (context, snapshot) {
          //* error Handler
          const loader = Column(
            children: [
              CListTileShimmer(),
              SizedBox(height: CSizes.spaceBtwItem),
              CBoxesShimmer(),
              SizedBox(height: CSizes.spaceBtwItem),
            ],
          );

          final widget = CCloudHelperFuntion.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          //* record found
          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    //* handle error
                    final widget = CCloudHelperFuntion.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    //  record found
                    final product = snapshot.data!;
                    return CBrandShowCase(
                      images: product.map((e) => e.thumbnail).toList(),
                      brand: brand,
                    );
                  });
            },
          );
        });
  }
}
