import 'package:ecommerce/features/authentication/controllers/onboarding/on_boarding_controller.dart';
import 'package:ecommerce/features/authentication/screens/on_boarding/widgets/onboarding_dotnavigation.dart';
import 'package:ecommerce/features/authentication/screens/on_boarding/widgets/onboarding_next_button.dart';
import 'package:ecommerce/util/constants/image_string.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          //* horizontal Scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              Padding(
                padding: EdgeInsets.all(CSizes.defaultSpace),
                child: OnBoardingPage(
                  image: CIMages.onBoardingImage1,
                  subTite: CText.onBordingSubTitle1,
                  title: CText.onBordingTitle1,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(CSizes.defaultSpace),
                child: OnBoardingPage(
                  image: CIMages.onBoardingImage2,
                  subTite: CText.onBordingSubTitle2,
                  title: CText.onBordingTitle2,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(CSizes.defaultSpace),
                child: OnBoardingPage(
                  image: CIMages.onBoardingImage3,
                  subTite: CText.onBordingSubTitle3,
                  title: CText.onBordingTitle3,
                ),
              )
            ],
          ), //* Skip Button

          //* Skip Button
          const OnBoardingSkip(),

          //* Smooth Indicator
          const OnBoardDotNaviagation(),

          //* Circular Button
          const OnBoardNextButton()
        ],
      ),
    );
  }
}
