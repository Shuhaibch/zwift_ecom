import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carousalCurrentindex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentindex.value = index;
  }
}
