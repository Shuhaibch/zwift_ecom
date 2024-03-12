import 'package:ecommerce/util/constants/image_string.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/constants/text_string.dart';
import 'package:ecommerce/util/helpers/helpe_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Image
            Image(
              image: const AssetImage(CIMages.deliveredEmailIllustration),
              width: CHelperFuntions.screenWidth() * .6,
            ),
            const SizedBox(
              height: CSizes.spaceBtwSection,
            ),

            //* Title & SubTitle
            Text(
              CText.changePasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: CSizes.spaceBtwItem,
            ),

            Text(
              CText.changePasswordSubtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: CSizes.spaceBtwSection,
            ),
            //* Submit Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(CText.done))),
            const SizedBox(
              height: CSizes.spaceBtwItem,
            ),
            SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: const Text(CText.resendEmail))),
          ],
        ),
      ),
    );
  }
}
