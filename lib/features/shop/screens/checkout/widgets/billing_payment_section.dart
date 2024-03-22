import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CBillingPaymnetSection extends StatelessWidget {
  const CBillingPaymnetSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return Column(
      children: [
        CSectionHeading(
            title: 'Payment Methord', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: CSizes.spaceBtwItem / 2),
        Row(
          children: [
            CRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? CColors.lightColor : CColors.whiteColor,
              padding: const EdgeInsets.all(CSizes.sm),
              child: Image(
                  image: AssetImage(CIMages.paymentGooglePay),
                  fit: BoxFit.contain),
            ),
            SizedBox(width: CSizes.spaceBtwItem / 2),
            Text('Google Pay', style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
