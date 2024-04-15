import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/personalization/controller/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/profile/profile_screen.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:ecommerce/utils/network_manager/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  //* Varaible
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userRepository = Get.put(UserRepository());
  final userController = UserController.instance;
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //* init userdata when screen is created
  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  // Fetch User Details
  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      CFullScreenLoader.openLoadingDialog(
          'We are updateing your information...', CIMages.lottieSignup);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      //Form validate
      if (!updateUserNameFormKey.currentState!.validate()) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      // Update Users firstname and lastname in firebase
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleFeild(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      CFullScreenLoader.stopLoading();

      //* Show Success message
      CLoaders.successSnackBar(
          title: 'Congratulation', message: 'Your Name has been Updated.');

      //* Move to previous Screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      CFullScreenLoader.stopLoading();
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
