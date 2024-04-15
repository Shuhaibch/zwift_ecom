import 'package:ecommerce/data/repositories/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/enum.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  //* variable
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProduct();
    super.onInit();
  }

  //* Get Featured Products Only
  void fetchFeaturedProduct() async {
    try {
      // loader
      isLoading.value = true;

      // fetch Product
      final product = await productRepository.getFeaturedProduct();

      // Assign the product

      featuredProducts.assignAll(product);
    } catch (e) {
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //* Get Featured Products Only
  Future<List<ProductModel>> fetchAllFeaturedProduct() async {
    try {
      // fetch Product
      final product = await productRepository.getAllFeaturedProduct();
      return product;
    } catch (e) {
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  //* Get the product Price or price range of variation
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // if no variation exist, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // calculate the smallest and largest amoung the variation
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price is avaqilable, otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest price.
        if (smallestPrice > priceToConsider) {
          smallestPrice = priceToConsider;
        }

        if (largestPrice < priceToConsider) {
          largestPrice = priceToConsider;
        }
      }

      // if smallest and largest price is the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // otherwise, return the price range
        return '$smallestPrice - $largestPrice';
      }
    }
  }

  //* calculate discount persentage
  String? calculateSalePercentage(double orginalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (orginalPrice <= 0) return null;
    double percentage = ((orginalPrice - salePrice) / orginalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  //* Check product stock status
  String getProductStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
