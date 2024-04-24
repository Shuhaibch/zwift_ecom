import 'package:ecommerce/commen/widgets/text/brand_title_text.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enum.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class CBrandTitleWithVerificationIcon extends StatelessWidget {
  const CBrandTitleWithVerificationIcon({
    super.key,
     this.title='',
    this.maxLines = 1,
    this.textColor,
    this.iconColor = CColors.primaryColor,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small, 
  });
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: CBrandTitleText(
          title: title,
          brandTextSize: brandTextSize,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
        )),
        const SizedBox(width: CSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: CSizes.iconXs,
        )
      ],
    );
  }
}
