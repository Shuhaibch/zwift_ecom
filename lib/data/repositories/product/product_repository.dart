import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/firebase_storage/firebase_storage_services.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/enum.dart';
import 'package:ecommerce/utils/exceptions/firebase_exception.dart';
import 'package:ecommerce/utils/exceptions/format_exception.dart';
import 'package:ecommerce/utils/exceptions/platform_exception.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  //* Firebase instance
  final _db = FirebaseFirestore.instance;

  //* Get limited featured Product
  Future<List<ProductModel>> getFeaturedProduct() async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromJson(e)).toList();
    } on CFirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on CFormatException catch (_) {
      throw const CFormatException();
    } on CPlatfromException catch (e) {
      throw CPlatfromException(e.code).message;
    } catch (e) {
      log(e.toString());
      throw "Something went wrong. Please try again";
    }
  }

  //* Get limited featured Product
  Future<List<ProductModel>> getAllFeaturedProduct() async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromJson(e)).toList();
    } on CFirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on CFormatException catch (_) {
      throw const CFormatException();
    } on CPlatfromException catch (e) {
      throw CPlatfromException(e.code).message;
    } catch (e) {
      log(e.toString());
      throw "Something went wrong. Please try again";
    }
  }

  //* Get Product based on brand by query
  Future<List<ProductModel>> fetchProductByQueary(Query query) async {
    try {
      final quarySnapshot = await query.get();
      final List<ProductModel> productList = quarySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapShot(doc))
          .toList();
      return productList;
    } on CFirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on CFormatException catch (_) {
      throw const CFormatException();
    } on CPlatfromException catch (e) {
      throw CPlatfromException(e.code).message;
    } catch (e) {
      log(e.toString());
      throw "Something went wrong. Please try again";
    }
  }

  //* Get favorite Product
  Future<List<ProductModel>> getFavoriteProduct(List<String> productsId) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productsId)
          .get();
      
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapShot(querySnapshot)).toList();
    } on CFirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on CFormatException catch (_) {
      throw const CFormatException();
    } on CPlatfromException catch (e) {
      throw CPlatfromException(e.code).message;
    } catch (e) {
      log(e.toString());
      throw "Something went wrong. Please try again";
    }
  }

  //* get Products For brand
  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();
      final product = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapShot(doc))
          .toList();
      return product;
    } on CFirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on CFormatException catch (_) {
      throw const CFormatException();
    } on CPlatfromException catch (e) {
      throw CPlatfromException(e.code).message;
    } catch (e) {
      log(e.toString());
      throw "Something went wrong. Please try again";
    }
  }

  //* get Products For Category
  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      // Query to get all documents where prodct id matches the provided category id & fetch limited or unlimited  based on limit

      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      // Extract productId from the document
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();

      // Query to get all document where the brandId is in the list of brandIds, FeildPath.documentId to qu
      final productQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Wxtract name  or other relevent data from the document
      List<ProductModel> products = productQuery.docs
          .map((doc) => ProductModel.fromSnapShot(doc))
          .toList();
      return products;
    } on CFirebaseException catch (e) {
      throw CFirebaseException(e.code).message;
    } on CFormatException catch (_) {
      throw const CFormatException();
    } on CPlatfromException catch (e) {
      throw CPlatfromException(e.code).message;
    } catch (e) {
      log(e.toString());
      throw "Something went wrong. Please try again";
    }
  }

  //* Upload dummy data AKA ADMIN
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Uplaod All Product Along with the image
      final storage = Get.put(CFirebaseStorageServices());

      // Loop through each product
      for (var product in products) {
        // Get image data link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its URL
        final url = await storage.uploadImageData(
            'Product/Images', thumbnail, product.thumbnail.toString());

        // assign Url to product.thumbnail attribute
        product.thumbnail = url;

        // Product List of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            // get image data link from local asset
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image to get its URl
            final url = await storage.uploadImageData(
                'Product/Images', assetImage, image.toString());

            // Assign URL to product.thumbnail attributes
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }

        //* Upload variation of Image
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // get Image data link from the local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            final url = await storage.uploadImageData(
                'Product/Images', assetImage, variation.image);

            // Assign URL to variation.thumbnail attributes
            variation.image = url;
          }
        }
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
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
}
