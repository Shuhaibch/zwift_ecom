
import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:ecommerce/commen/widgets/icons/c_curcular_icon.dart';
import 'package:ecommerce/commen/widgets/images/c_rounded_images.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CImageSlider extends StatelessWidget {
  const CImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);

    return CCurvedWidgets(
      
      child: Container(
        color: dark ? CColors.darkerGreyColor : CColors.lightColor,
        child: Stack(
          children: [
            //* Appbar Icons
            const CAppbar(
              showBackArrow: true,
              actions: [
                CCircularIcon(icon: Iconsax.heart5, color: Colors.red)
              ],
            ),
    
            //* Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(CSizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(CIMages.productShoes)),
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
                  itemCount: 4,
                  itemBuilder: (_, index) => CRoundedImage(
                    imageUrl: CIMages.productShoes2,
                    width: 80,
                    backgroundColor:
                        dark ? CColors.darkColor : CColors.whiteColor,
                    border: Border.all(color: CColors.primaryColor),
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
