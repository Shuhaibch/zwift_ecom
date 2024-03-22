import 'package:ecommerce/features/authentication/controllers/onboarding/on_boarding_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardNextButton extends StatelessWidget {
  const OnBoardNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return Positioned(
      right: CSizes.defaultSpace,
      bottom: CDeviceUtils.getBottomnNavigationbarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? CColors.primaryColor : Colors.black,
        ),
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
