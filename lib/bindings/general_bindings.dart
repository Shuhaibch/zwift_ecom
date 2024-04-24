import 'package:ecommerce/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce/utils/network_manager/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}
