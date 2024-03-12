import 'package:ecommerce/features/authentication/controllers/onboarding/on_boarding_controller.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: CDeviceUtils.getAppBarHeight(),
        right: CSizes.defaultSpace,
        child: TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: const Text("Skip")));
  }
}
