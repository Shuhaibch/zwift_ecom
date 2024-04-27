import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce/features/shop/models/payment_methord_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CPaymentTile extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  const CPaymentTile({super.key, required this.paymentMethod});
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethord.value =paymentMethod;
        Get.back();
      },
      leading: CRoundedContainer(
        width: 60,
        height: 35,
        backgroundColor: dark ? CColors.lightColor : CColors.whiteColor,
        padding: const EdgeInsets.all(CSizes.sm),
        child:  Image(
            image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
