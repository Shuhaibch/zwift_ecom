
import 'package:ecommerce/util/constants/colors.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/helpers/helpe_functions.dart';
import 'package:flutter/material.dart';

class CVerticalImageText extends StatelessWidget {
  const CVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = CColors.whiteColor,
    this.backgroundColor,
    this.onTap,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: CSizes.spaceBtwItem),
        child: Column(
          children: [
            //* Circular Item
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(CSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ??
                    (dark
                        ? CColors.blackColor
                        : CColors.whiteColor),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: dark
                      ? CColors.lightColor
                      : CColors.darkColor,
                ),
              ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
