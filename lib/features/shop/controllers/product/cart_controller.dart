import 'package:ecommerce/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce/features/shop/models/cart_item_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/enum.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:ecommerce/utils/storage_utility/storage_utility.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  CartController() {
    loadCartItems();
  }

  //* Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
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

    // Convert ProductModel into cartModel with the given quantty
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    // Check if already added in the cart
    int index = cartItem.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // This quantity is already added or updated/removed form the design(Cart)
      cartItem[index].quantity = selectedCartItem.quantity;
    } else {
      cartItem.add(selectedCartItem);
    }

    updateCart();
    CLoaders.customToast(message: 'Your product has been added to the cart.');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItem.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItem[index].quantity += 1;
    } else {
      cartItem.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItem.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index >= 0) {
      if (cartItem[index].quantity > 1) {
        cartItem[index].quantity -= 1;
      } else {
        // show dialog before completely removing
        cartItem[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItem.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        // remove the item from the cart
        cartItem.removeAt(index);
        updateCart();
        CLoaders.customToast(message: 'Product removed from the cart');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  //*  initialize already added item's count in cart.
  void updateAlreadyAddedProductCount(ProductModel product) {
    // if product has no variation then calculate cartEntries and disoplay total number.
    // Else make default entries to  and show cartEntries when variation is selected.

    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityinCart(product.id);
    } else {
      // Get selected variatoin if any
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
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

  //* Update Cart Values
  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItem.refresh();
  }

  void updateCartTotal() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItem) {
      calculatedTotalPrice = (item.price) * item.quantity.toDouble();
      calculatedNoOfItems = item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItem.map((item) => item.toJson()).toList();
    CLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        CLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItem.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }

  int getProductQuantityinCart(String productId) {
    final foundItem = cartItem
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);

    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItem.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItem.clear();
    updateCart();
  }
}
