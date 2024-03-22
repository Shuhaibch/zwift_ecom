import 'package:ecommerce/data/repositories/authentication/authenticatoin_repostory.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/user/user_model.dart';
import 'package:ecommerce/features/authentication/screens/signup/verifty_email_screen.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:ecommerce/utils/network_manager/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //* variable
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //* SignUp
  Future<void> signup() async {
    try {
      // Start Loading
      CFullScreenLoader.openLoadingDialog(
          'We are processing your information', CIMages.lottieSignup);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      //Form validate
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy
      if (!privacyPolicy.value) {
        CLoaders.warnigSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of use.',
        );
        return;
      }

      // Registe User with firebase Authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user in the firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: firstName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      CFullScreenLoader.stopLoading();

      //show Success Message
      CLoaders.successSnackBar(
          title: "Congratulations",
          message: 'Your Accouunt has been created! Verify email to continue.');

      // Move to verify email screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      CFullScreenLoader.stopLoading();

      //* show some generic errors
      CLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
