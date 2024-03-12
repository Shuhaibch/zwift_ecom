import 'package:ecommerce/features/authentication/controllers/onboarding/on_boarding_controller.dart';
import 'package:ecommerce/util/constants/colors.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/device/device_utility.dart';
import 'package:ecommerce/util/helpers/helpe_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardDotNaviagation extends StatelessWidget {
  const OnBoardDotNaviagation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = CHelperFuntions.isDarkMode(context);
    return Positioned(
      bottom: CDeviceUtils.getBottomnNavigationbarHeight() + 25,
      left: CSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? CColors.lightColor : CColors.darkColor,
          dotHeight: 6,
        ),
      ),
    );
  }
}
