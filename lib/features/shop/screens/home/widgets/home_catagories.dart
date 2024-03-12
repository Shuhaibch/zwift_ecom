
import 'package:ecommerce/commen/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ecommerce/util/constants/image_string.dart';
import 'package:flutter/material.dart';

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
            return const CVerticalImageText(
              image: CIMages.clothsIcon,
              title: "pet",
            );
          }),
    );
  }
}
