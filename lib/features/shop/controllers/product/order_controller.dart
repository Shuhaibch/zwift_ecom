import 'package:ecommerce/commen/success/success_screen.dart';
import 'package:ecommerce/data/repositories/authentication/authenticatoin_repostory.dart';
import 'package:ecommerce/data/repositories/order/order_repository.dart';
import 'package:ecommerce/features/personalization/controller/address_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce/features/shop/models/order_model.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/enum.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  //* variable
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  //* Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrder();
      return userOrders;
    } catch (e) {
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  //* Add methord for order process
  void processOrder(double totalAmount) async {
    try {
      // start loader
      CFullScreenLoader.openLoadingDialog(
          'Processing your order', CIMages.secondScreenLotties);

      // Get ur authentication ID
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
        id: UniqueKey().toString(),
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        items: cartController.cartItem.toList(),
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethord.value.name,
        userId: userId,
      );

      // Save order to firestore
      await orderRepository.saveOrder(order, userId);

      // Update the cart Status
      cartController.clearCart();

      // Show success Screen
      Get.off(
        () => SuccessScreen(
          image: CIMages.orderConfirmLottie,
          title: 'Payment Success',
          subTitle: 'Your item will be shipped soon!',
          onPressed: () => Get.offAll(() => const NavigationMenu()),
        ),
      );
    } catch (e) {
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
