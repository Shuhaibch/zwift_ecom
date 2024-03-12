
import 'package:ecommerce/util/constants/colors.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/constants/text_string.dart';
import 'package:ecommerce/util/helpers/helpe_functions.dart';
import 'package:flutter/material.dart';

class CTermAndConditions extends StatelessWidget {
  const CTermAndConditions({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    
    final dark = CHelperFuntions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
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
                      color: dark
                          ? CColors.whiteColor
                          : CColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: dark
                          ? CColors.whiteColor
                          : CColors.primaryColor,
                    ),
              ),
              TextSpan(
                  text: ' ${CText.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: CText.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark
                          ? CColors.whiteColor
                          : CColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: dark
                          ? CColors.whiteColor
                          : CColors.primaryColor,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
