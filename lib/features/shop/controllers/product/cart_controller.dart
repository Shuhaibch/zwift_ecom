import 'package:ecommerce/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce/features/shop/models/cart_item_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/enum.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  //* Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartProducts = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItem = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  //* add product to cart
  void addToCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      CLoaders.customToast(message: 'Select Quantity');
      return;
    }

    // variation selected
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      CLoaders.customToast(message: 'Select Variation');
      return;
    }

    // Out of Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        CLoaders.warnigSnackBar(
            title: 'Oh Snap!', message: 'Selecte variation is out of stock.');
        return;
      }
    } else {
      if (product.stock < 1) {
        CLoaders.warnigSnackBar(
            title: 'Oh Snap!', message: 'Selecte Product is out of stock.');
        return;
      }
    }
  }

  //* This function convert ProductModel into cartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      // Reset variation in case of single product type.
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;
    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      brandName: product.brand != null ? product.brand!.name : '',
      image: isVariation ? variation.image : product.thumbnail,
      price: price,
      selectedVariation: isVariation ? variation.attributeValues : null,
      title: product.title,
      variationId: variation.id,
    );
  }
}
