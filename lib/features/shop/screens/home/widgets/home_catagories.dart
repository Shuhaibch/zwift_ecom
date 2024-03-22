import 'package:ecommerce/commen/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ecommerce/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CHomeCatagories extends StatelessWidget {
  const CHomeCatagories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (_, index) {
            return CVerticalImageText(
              onTap: () => Get.to(() => const SubCategoriesScreen()),
              image: CIMages.clothsIcon,
              title: "pet",
            );
          }),
    );
  }
}
