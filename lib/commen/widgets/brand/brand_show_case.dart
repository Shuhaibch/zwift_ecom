
import 'package:ecommerce/commen/widgets/brand/brand_card.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/util/constants/colors.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/helpers/helpe_functions.dart';
import 'package:flutter/material.dart';

class CBrandShowCase extends StatelessWidget {
  const CBrandShowCase({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      showBorder: true,
      borderColor: CColors.darkGreyColor,
      padding: const EdgeInsets.all(CSizes.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItem),
      child: Column(
        children: [
          //* Brand With Product Count
          const CBrandCard(showBorder: false),
          const SizedBox(height: CSizes.spaceBtwItem),

          //* Brand Top 3 Product
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: CRoundedContainer(
        height: 100,
        backgroundColor: CHelperFuntions.isDarkMode(context)
            ? CColors.darkerGreyColor
            : CColors.lightColor,
        margin: const EdgeInsets.only(right: CSizes.sm),
        padding: const EdgeInsets.all(CSizes.md),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
