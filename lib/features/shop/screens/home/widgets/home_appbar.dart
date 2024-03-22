
import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class CHomeAppbar extends StatelessWidget {
  const CHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CText.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: CColors.greyColor),
          ),
          Text(
            CText.homeAppbarSubitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: CColors.whiteColor),
          ),
        ],
      ),
      actions: const [
        CCartCounterIcon(
          iconColor: CColors.whiteColor,
        )
      ],
    );
  }
}
