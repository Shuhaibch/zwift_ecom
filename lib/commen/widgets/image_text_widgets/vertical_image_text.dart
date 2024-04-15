import 'package:ecommerce/commen/widgets/images/c_circular_image.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CVerticalImageText extends StatelessWidget {
  const CVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = CColors.whiteColor,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: CSizes.spaceBtwItem),
        child: Column(
          children: [
            //* Circular Icon
            CCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: CSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? CColors.lightColor : CColors.darkColor,
            ),

            const SizedBox(
              height: CSizes.spaceBtwItem / 2,
            ),

            //* Text
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: textColor,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

//  Container(
//               width: 56,
//               height: 56,
//               padding: const EdgeInsets.all(CSizes.sm),
//               decoration: BoxDecoration(
//                 color: backgroundColor ??
//                     (dark ? CColors.blackColor : CColors.whiteColor),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: Center(
//                 child: Image(
//                   image: AssetImage(image),
//                   fit: BoxFit.cover,
//                   color: dark ? CColors.lightColor : CColors.darkColor,
//                 ),
//               ),
//             ),