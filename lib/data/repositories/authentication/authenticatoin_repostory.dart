import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/authentication/screens/on_boarding/onboarding.dart';
import 'package:ecommerce/features/authentication/screens/signup/verifty_email_screen.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/exceptions/firebase_auth_exception.dart';
import 'package:ecommerce/utils/exceptions/firebase_exception.dart';
import 'package:ecommerce/utils/exceptions/format_exception.dart';
import 'package:ecommerce/utils/exceptions/platform_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //* variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //* called from main.dart on app lauch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //* Function to show Relevent Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    // Check the user is logged in or not
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check the user is opening the app for first time
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  //? ------------------- Email Password signIn -----------------------

  //* [Email Authentication] - SignIn

  //* [Email Authentication] - Register
  Future<UserCredential> registerWithEmailPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on CFirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on CFormatException catch (_) {
      throw const CFormatException();
    } on CPlatfromException catch (e) {
      throw CPlatfromException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  //* [EmailVerification] - Mail Verification
  Future<void> sendEmailVerifiacation() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on CFirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on CFormatException catch (_) {
      throw const CFormatException();
    } on CPlatfromException catch (e) {
      throw CPlatfromException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  //* [ReAuthenticate] - ReAuthenticate User

  //* [Email Authentication] - Forget Password

  //? ------------------- Fedeted Identity & Social Sign-in -----------------------

  //* [Google Authentication] - Google

  //* [Facebook Authentication] - Facebook

  //? ------------------- ./end Fedeted Identity & Social Sign-in -----------------------

  //* [Logout User] - Valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthException(e.code).message;
    } on CFirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on CFormatException catch (_) {
      throw const CFormatException();
    } on CPlatfromException catch (e) {
      throw CPlatfromException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  //* Delete User  - Remove user auth and Firebase Account
}
