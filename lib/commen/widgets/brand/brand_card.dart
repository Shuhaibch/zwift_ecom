import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/images/c_circular_image.dart';
import 'package:ecommerce/commen/widgets/text/brand_title_with_verification_icon.dart';
import 'package:ecommerce/util/constants/colors.dart';
import 'package:ecommerce/util/constants/enum.dart';
import 'package:ecommerce/util/constants/image_string.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/helpers/helpe_functions.dart';
import 'package:flutter/material.dart';

class CBrandCard extends StatelessWidget {
  const CBrandCard({
    super.key, required this.showBorder, this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    


    return GestureDetector(
      onTap: onTap,
      child: CRoundedContainer(
        padding: const EdgeInsets.all(CSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //* icon
            Flexible(
              child: CCircularImage(
                image: CIMages.brandNike,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: CHelperFuntions.isDarkMode(context)
                    ? CColors.whiteColor
                    : CColors.blackColor,
              ),
            ),
            const SizedBox(
              width: CSizes.spaceBtwItem / 2,
            ),

            //* Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CBrandTitleWithVerificationIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
