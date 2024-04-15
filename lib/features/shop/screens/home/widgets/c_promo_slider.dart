// ignore_for_file: unrelated_type_equality_checks

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/circular_containers.dart';
import 'package:ecommerce/commen/widgets/images/c_rounded_images.dart';
import 'package:ecommerce/commen/widgets/shimmer/shimmer_loader.dart';
import 'package:ecommerce/features/shop/controllers/banner_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CPromoSlider extends StatelessWidget {
  const CPromoSlider({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const CShimmerEffect(width: double.infinity, height: 190);
        }
        if (controller.banners.isEmpty) {
          return const Center(
            child: Text('Banner Not Found'),
          );
        }
        return Column(
          children: [
            CarouselSlider(
              items: controller.banners
                  .map((banner) => CRoundedImage(
                        isNetworkImage: true,
                        imageUrl: banner.imageUrl,
                      ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
            ),
            const SizedBox(
              height: CSizes.spaceBtwItem,
            ),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      CCircularContainer(
                        width: 20,
                        height: 4,
                        backgroundColor: controller.carousalCurrentindex == i
                            ? CColors.primaryColor
                            : CColors.greyColor,
                        margin: const EdgeInsets.only(right: 10),
                      )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
