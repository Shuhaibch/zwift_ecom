import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:ecommerce/commen/widgets/images/c_rounded_images.dart';
import 'package:ecommerce/commen/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:ecommerce/features/shop/controllers/product/images_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CImageSlider extends StatelessWidget {
  const CImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return CCurvedWidgets(
      child: Container(
        color: dark ? CColors.darkerGreyColor : CColors.lightColor,
        child: Stack(
          children: [
            //* Appbar Icons
            CAppbar(
              showBackArrow: true,
              leadingOnPressed: () => Navigator.pop(context),
              actions: [CFavoriteIcon(productId: product.id)],
            ),

            //* Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(CSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (__, _, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: CColors.primaryColor),
                      ),
                    );
                  }),
                ),
              ),
            ),

            //* Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: CSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: CSizes.spaceBtwItem,
                  ),
                  itemCount: images.length,
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected =
                          controller.selectedProductImage.value ==
                              images[index];
                      return CRoundedImage(
                        onPressed: () => controller.selectedProductImage.value =
                            images[index],
                        isNetworkImage: true,
                        imageUrl: images[index],
                        width: 80,
                        backgroundColor:
                            dark ? CColors.darkColor : CColors.whiteColor,
                        border: Border.all(
                            color: imageSelected
                                ? CColors.primaryColor
                                : Colors.transparent),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
