import 'package:ecommerce/data/repositories/authentication/authenticatoin_repostory.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:ecommerce/utils/network_manager/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordCotroller extends GetxController {
  static ForgetPasswordCotroller get instance => Get.find();

  //* Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //* Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loader
      CFullScreenLoader.openLoadingDialog(
          'Logging you in....', CIMages.deliveredEmailLotties);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      //Form validate
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      CFullScreenLoader.stopLoading();

      // Show Success Screen
      CLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Email link sent to reset your password.'.tr,
      );

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      CFullScreenLoader.stopLoading();

      CLoaders.successSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loader
      CFullScreenLoader.openLoadingDialog(
          'Logging you in....', CIMages.deliveredEmailLotties);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

    

      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      // Remove Loader
      CFullScreenLoader.stopLoading();

      // Show Success Screen
      CLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Email link sent to reset your password.'.tr,
      );

   } catch (e) {
      // Remove Loader
      CFullScreenLoader.stopLoading();

      CLoaders.successSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }
}
