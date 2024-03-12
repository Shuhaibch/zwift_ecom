import 'package:ecommerce/commen/success/success_screen.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/util/constants/image_string.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/constants/text_string.dart';
import 'package:ecommerce/util/helpers/helpe_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
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
                CText.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtwItem,
              ),
              Text(
                'support@zwift.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtwItem,
              ),
              Text(
                CText.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSection,
              ),

              //* Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(
                          () => SuccessScreen(
                            image: CIMages.staticSuccessIllustration,
                            title: CText.yourAccountCreatedTitle,
                            subTitle: CText.yourAccountCreatedSubTitle,
                            onPressed: () => Get.to(() => const LoginScreen()),
                          ),
                        ),
                    child: const Text(CText.cContinue)),
              ),
              const SizedBox(
                height: CSizes.spaceBtwItem,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: const Text(CText.resendEmail)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
