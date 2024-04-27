import 'package:ecommerce/commen/widgets/list_tile/payment_tile.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/models/payment_methord_model.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  //* Variables
  final Rx<PaymentMethodModel> selectedPaymentMethord =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethord.value =
        PaymentMethodModel(name: 'Paypal', image: CIMages.paymentPayPal);
    super.onInit();
  }

  //* Bottom Sheet
  Future<dynamic> selectPaymentMethord(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(CSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CSectionHeading(
                title: 'Select Payment Method',
                showActionButton: false,
              ),
              const SizedBox(height: CSizes.spaceBtwSection),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paypal', image: CIMages.paymentPayPal)),
              const SizedBox(height: CSizes.spaceBtwItem / 2),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Apple Pay', image: CIMages.paymentApple)),
              const SizedBox(height: CSizes.spaceBtwItem / 2),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Credit Card', image: CIMages.paymentCreditCard)),
              const SizedBox(height: CSizes.spaceBtwItem / 2),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Master Card', image: CIMages.paymentMasterCard)),
              const SizedBox(height: CSizes.spaceBtwItem / 2),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Visa Card', image: CIMages.paymentVisaCard)),
              const SizedBox(height: CSizes.spaceBtwItem / 2),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Google Pay', image: CIMages.paymentGooglePay)),
              const SizedBox(height: CSizes.spaceBtwItem / 2),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'PayTM', image: CIMages.paymentPayTM)),
              const SizedBox(height: CSizes.spaceBtwItem / 2),
              CPaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Pay Stack', image: CIMages.paymentPayStack)),
              const SizedBox(height: CSizes.spaceBtwItem / 2),
              const SizedBox(height: CSizes.spaceBtwSection),
            ],
          ),
        ),
      ),
    );
  }
}
