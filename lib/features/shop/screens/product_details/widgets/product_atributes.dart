import 'package:ecommerce/commen/widgets/chips/choice_chips.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/text/product_price_text.dart';
import 'package:ecommerce/commen/widgets/text/product_title_text.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CProductAtributes extends StatelessWidget {
  const CProductAtributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return Column(
      children: [
        //* Selected Atribute Pricing & Description
        CRoundedContainer(
          padding: const EdgeInsets.all(CSizes.md),
          backgroundColor: dark ? CColors.darkerGreyColor : CColors.greyColor,
          child: Column(
            children: [
              //* Title Price and Stock Counts
              Row(
                children: [
                  const CSectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: CSizes.spaceBtwItem),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CProductTitleText(
                              title: 'Price : ', smallSize: true),
                          const SizedBox(width: CSizes.spaceBtwItem / 1.5),

                          //* Actial Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: CSizes.spaceBtwItem / 1.5),

                          //* Sale Price
                          const CProductPriceText(price: '20')
                        ],
                      ),

                      //* Stock
                      Row(
                        children: [
                          const CProductTitleText(
                              title: "Stock : ", smallSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              //* Variation Description
              const CProductTitleText(
                  title:
                      'This is the Description of the Product and it can go upto max 4 lines.',
                  smallSize: true,
                  maxLine: 4)
            ],
          ),
        ),
        const SizedBox(height: CSizes.spaceBtwItem),

        //* Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CSectionHeading(title: "Colors"),
            const SizedBox(height: CSizes.spaceBtwItem / 2),
            Wrap(
              spacing: 8,
              children: [
                CChooiceChip(
                    text: 'Green', selected: true, onSelected: (value) {}),
                CChooiceChip(
                    text: 'Red', selected: false, onSelected: (value) {}),
                CChooiceChip(
                    text: 'Blue', selected: false, onSelected: (value) {}),
                CChooiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
                CChooiceChip(
                    text: 'Black', selected: false, onSelected: (value) {}),
                CChooiceChip(
                    text: 'White', selected: false, onSelected: (value) {}),
                CChooiceChip(
                    text: 'Orange', selected: false, onSelected: (value) {}),
                CChooiceChip(
                    text: 'Lime', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CSectionHeading(title: "Size"),
            const SizedBox(height: CSizes.spaceBtwItem / 2),
            Wrap(
              spacing: 8,
              children: [
                CChooiceChip(
                    text: 'EU 34', selected: true, onSelected: (value) {}),
                CChooiceChip(
                    text: 'EU 36', selected: false, onSelected: (value) {}),
                CChooiceChip(
                    text: 'EU 38', selected: false, onSelected: (value) {}),
                CChooiceChip(
                    text: 'EU 40', selected: false, onSelected: (value) {}),
                CChooiceChip(
                    text: 'EU 42', selected: false, onSelected: (value) {}),
                CChooiceChip(
                    text: 'EU 44', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        )
      ],
    );
  }
}
