import 'package:ecommerce/commen/styles/spacing_styles.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });
  final String image, title, subTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CSpacingStyle.paddingWithAppbarStyle,
          child: Column(
            children: [
              //* Image
              Image(
                image: AssetImage(image),
                width: CHelperFuntions.screenWidth() * .6,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSection,
              ),

              //* Title & SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtwItem,
              ),

              Text(
                subTitle,
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
                    onPressed: onPressed, child: const Text(CText.cContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
