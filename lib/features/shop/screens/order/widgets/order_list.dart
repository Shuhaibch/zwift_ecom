import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class COrderListItems extends StatelessWidget {
  const COrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) => SizedBox(height: CSizes.spaceBtwItem),
      itemBuilder: (_, index) => CRoundedContainer(
        padding: const EdgeInsets.all(CSizes.md),
        showBorder: true,
        backgroundColor: dark ? CColors.darkColor : CColors.lightColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //* Row 1
            Row(
              children: [
                //* Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: CSizes.spaceBtwItem / 2),

                //* status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: CColors.primaryColor, fontSizeDelta: 1),
                      ),
                      Text('07 Nov 2023',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.arrow_right_34,
                        size: CSizes.iconSm)),
              ],
            ),
            const SizedBox(height: CSizes.spaceBtwItem),
            //* Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      //* Icon
                      const Icon(Iconsax.ship),
                      const SizedBox(width: CSizes.spaceBtwItem / 2),

                      //* status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('[#12564f]',
                                style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //* Row inside row
                Expanded(
                  child: Row(
                    children: [
                      //* Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: CSizes.spaceBtwItem / 2),

                      //* status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('03 Feb 2024',
                                style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
