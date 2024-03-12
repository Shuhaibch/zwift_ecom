import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //* Variable
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //* Update Current Index when page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //* Jumb to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  //* Update Current Index and jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //* Update Current Index and Jump to last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
