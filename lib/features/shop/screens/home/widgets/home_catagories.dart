import 'package:ecommerce/commen/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ecommerce/commen/widgets/shimmer/category_shimmer.dart';
import 'package:ecommerce/features/shop/controllers/catogory_controler.dart';
import 'package:ecommerce/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CHomeCatagories extends StatelessWidget {
  const CHomeCatagories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(
      () {
        if (controller.isLoading.value) return const CCategoryShimmer();

        if (controller.featuredCategories.isEmpty) {
          return Center(
              child: Text('No data found!',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: CColors.whiteColor)));
        }

        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.featuredCategories.length,
            itemBuilder: (_, index) {
              final category = controller.featuredCategories[index];
              return CVerticalImageText(
                
                onTap: () => Get.to(() =>  SubCategoriesScreen(category:category)),
                image: category.image,
                title: category.name,
              );
            },
          ),
        );
      },
    );
  }
}
