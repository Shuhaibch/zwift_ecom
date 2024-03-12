import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/circular_containers.dart';
import 'package:ecommerce/commen/widgets/images/c_rounded_images.dart';
import 'package:ecommerce/features/shop/controllers/home_controller.dart';
import 'package:ecommerce/util/constants/colors.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CPromoSlider extends StatelessWidget {
  const CPromoSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => CRoundedImage(imageUrl: url)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
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
                for (int i = 0; i < banners.length; i++)
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
  }
}
