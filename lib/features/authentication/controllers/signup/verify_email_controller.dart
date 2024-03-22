import 'dart:async';

import 'package:ecommerce/commen/success/success_screen.dart';
import 'package:ecommerce/data/repositories/authentication/authenticatoin_repostory.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //* Send email whenever verify screen appers & Set Timer for auto redirect.

  @override
  void onInit() {
    sendEmailVerification();
    setTimerforAutoRedirect();
    super.onInit();
  }

  //* Send Email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerifiacation();
      CLoaders.successSnackBar(
          title: 'On Snap!',
          message: 'Please check your inbox and verify your email.');
    } catch (e) {
      CLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }

  //* Timer to automatically redirect on Email Verification

  setTimerforAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser!.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: CIMages.successfullRegistrationIllustration,
              title: CText.yourAccountCreatedTitle,
              subTitle: CText.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  //* Manually check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: CIMages.successfullRegistrationIllustration,
          title: CText.yourAccountCreatedTitle,
          subTitle: CText.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
