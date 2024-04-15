import 'package:ecommerce/data/repositories/authentication/authenticatoin_repostory.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/user/user_model.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:ecommerce/utils/network_manager/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  @override
  onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //* Fetch User Records
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //* Save User Record from any Registration Provided
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // First Update the Rx user and then check if data is alreadu Stored.If not stored new data.
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // conver name to first name and second name
          final nameParts =
              UserModel.namePart(userCredential.user!.displayName ?? '');

          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          // Map data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.email ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          //* Save User data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      CLoaders.warnigSnackBar(
          title: 'Data not Saved',
          message:
              'Something went wrong while saving your information. You can re-save your data on the profile.');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(CSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversable and all your data will be permenantky removed',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: CSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  //* Delete User  Account
  void deleteUserAccount() async {
    try {
      CFullScreenLoader.openLoadingDialog('Processing', CIMages.lottieSignup);

      // First Reauthenticate User
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          CFullScreenLoader.stopLoading();
          Get.to(() => const LoginScreen());
        } else if (provider == 'password') {
          CFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      CFullScreenLoader.stopLoading();
      CLoaders.warnigSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //* RE-Athenticate before Deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start Loading
      CFullScreenLoader.openLoadingDialog(
          'We are updating your information...', CIMages.lottieSignup);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      //Form validate
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove Loader
        CFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      CFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      CFullScreenLoader.stopLoading();
      CLoaders.warnigSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //* upload Profile image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update User Profile Screen
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleFeild(json);

        user.value.profilePicture = imageUrl;
        CLoaders.successSnackBar(
            title: 'Congragulations!',
            message: 'Your Profile image has bees successfully updated!');
      }
    } catch (e) {
      CLoaders.warnigSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong: $e');
    }
  }
}
