import 'package:ecommerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CTermAndConditions extends StatelessWidget {
  const CTermAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = CHelperFuntions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(
          width: CSizes.spaceBtwItem,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${CText.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: CText.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? CColors.whiteColor : CColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? CColors.whiteColor : CColors.primaryColor,
                    ),
              ),
              TextSpan(
                  text: ' ${CText.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: CText.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? CColors.whiteColor : CColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? CColors.whiteColor : CColors.primaryColor,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
