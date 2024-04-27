import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CBillingPaymentSection extends StatelessWidget {
  const CBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    final controller = CheckoutController.instance;
    return Column(
      children: [
        CSectionHeading(
            title: 'Payment Methord',
            buttonTitle: 'Change',
            onPressed: () => controller.selectPaymentMethord(context)),
        const SizedBox(height: CSizes.spaceBtwItem / 2),
        Obx(
          () => Row(
            children: [
              CRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? CColors.lightColor : CColors.whiteColor,
                padding: const EdgeInsets.all(CSizes.sm),
                child: Image(
                    image: AssetImage(
                        controller.selectedPaymentMethord.value.image),
                    fit: BoxFit.contain),
              ),
              const SizedBox(width: CSizes.spaceBtwItem / 2),
              Text(controller.selectedPaymentMethord.value.name,
                  style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
        )
      ],
    );
  }
}
