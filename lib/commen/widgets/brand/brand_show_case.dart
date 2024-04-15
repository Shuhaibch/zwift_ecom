// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/commen/widgets/shimmer/shimmer_loader.dart';
import 'package:ecommerce/features/shop/screens/brands/brand_product.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/commen/widgets/brand/brand_card.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class CBrandShowCase extends StatelessWidget {
  const CBrandShowCase({
    super.key,
    required this.brand,
    required this.images,
  });
  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=> BrandProducts(brand: brand)),
      child: CRoundedContainer(
        showBorder: true,
        borderColor: CColors.darkGreyColor,
        padding: const EdgeInsets.all(CSizes.md),
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItem),
        child: Column(
          children: [
            //* Brand With Product Count
            CBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: CSizes.spaceBtwItem),
      
            //* Brand Top 3 Product
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            )
          ],
        ),
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
        child: CachedNetworkImage(imageUrl: image, progressIndicatorBuilder: (context, url, progress) => const CShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),)
      ),
    );
  }
}
