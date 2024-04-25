import 'package:ecommerce/features/shop/controllers/product/cart_controller.dart';
import 'package:ecommerce/features/shop/controllers/product/images_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  //* variable
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  //* select Attribute and varition
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    // When attribute is selected we will first add that attriburte to the selectedAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    // Show Selected variation image as Main image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    // Show selected variotion quantity already in cart.
    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController
          .getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    // Assign selected variation
    this.selectedVariation.value = selectedVariation;

    // Update selected product variation status
    getProductVariationStockStatus();
  }

  //* check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    // if seleted attributes contains 3 attributes and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any attributes are deffrent then return [green , large] x [green, small]
    for (var key in variationAttributes.keys) {
      // Atributes[key] = Value which could be [green, small , cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return false;
  }

  //* Check attribute availability / Stock in variation
  Set getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    // pass the variation to check which attributes are available and stock is nor 0
    final availableVariationAttributeValues = variations
        .where((variation) =>
            // check Empty / Out of Stock Attribute
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  //* Check product variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  //* Reset selected Attribute when swiching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
