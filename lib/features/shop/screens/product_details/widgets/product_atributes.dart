import 'package:ecommerce/commen/widgets/chips/choice_chips.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/text/product_price_text.dart';
import 'package:ecommerce/commen/widgets/text/product_title_text.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CProductAtributes extends StatelessWidget {
  const CProductAtributes({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = CHelperFuntions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          //* Selected Atribute Pricing & Description
          // display variation price and stock when some variation is selcted.
          if (controller.selectedVariation.value.id.isNotEmpty)
            CRoundedContainer(
              padding: const EdgeInsets.all(CSizes.md),
              backgroundColor:
                  dark ? CColors.darkerGreyColor : CColors.greyColor,
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
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.getVariationPrice()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              const SizedBox(width: CSizes.spaceBtwItem / 1.5),

                              //* Sale Price
                              CProductPriceText(
                                  price: controller.getVariationPrice())
                            ],
                          ),

                          //* Stock
                          Row(
                            children: [
                              const CProductTitleText(
                                  title: "Stock : ", smallSize: true),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  //* Variation Description
                  CProductTitleText(
                      title:
                          controller.selectedVariation.value.description ?? '',
                      smallSize: true,
                      maxLine: 4)
                ],
              ),
            ),
          const SizedBox(height: CSizes.spaceBtwItem),

          //* Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CSectionHeading(title: attribute.name ?? ''),
                      const SizedBox(height: CSizes.spaceBtwItem / 2),
                      Obx(
                        () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);
                              return CChooiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                                product,
                                                attribute.name ?? '',
                                                attributeValue);
                                          }
                                        }
                                      : null);
                            }).toList()),
                      )
                    ],
                  ),
                )
                .toList(),
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
      ),
    );
  }
}
