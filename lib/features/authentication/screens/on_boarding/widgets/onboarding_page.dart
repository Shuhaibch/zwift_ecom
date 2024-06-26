import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTite,
  });
  final String image, title, subTite;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // LottieBuilder.asset(image, f)
        LottieBuilder.asset(
          image,
          fit: BoxFit.contain,
          width: CHelperFuntions.screenWidth() * .8,
          height: CHelperFuntions.screenHeight() * .6,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: CSizes.spaceBtwItem,
        ),
        Text(
          subTite,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
