import 'package:ecommerce/data/repositories/authentication/authenticatoin_repostory.dart';
import 'package:ecommerce/features/personalization/controller/user_controller.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:ecommerce/utils/network_manager/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //* Variable
  final rememberMe = true.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  @override
  onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? "";
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? "";
    super.onInit();
  }

  //* SignUp
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
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
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if remenber me is on
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login User with firebase Authentication
      // ignore: unused_local_variable
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      CFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      CFullScreenLoader.stopLoading();

      //* show some generic errors
      CLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  //* Google Signin Authentication
  Future<void> googleSignIn() async {
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

      // Google Authentication
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Records
      await userController.saveUserRecord(userCredential);

      // Remove Loader
      CFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      CFullScreenLoader.stopLoading();

      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
