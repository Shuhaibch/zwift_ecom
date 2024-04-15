import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/firebase_storage/firebase_storage_services.dart';
import 'package:ecommerce/features/shop/models/catagory_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exception.dart';
import 'package:ecommerce/utils/exceptions/format_exception.dart';
import 'package:ecommerce/utils/exceptions/platform_exception.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //* variable
  final _db = FirebaseFirestore.instance;

  //* Get all catagories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      return snapshot.docs
          .map((document) => CategoryModel.fromSnapShot(document))
          .toList();
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

  //* Get sub catagories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db.collection('Categories').where('ParentId', isEqualTo: categoryId).get();
      return snapshot.docs
          .map((document) => CategoryModel.fromSnapShot(document))
          .toList();
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

  //* Upload category to cloud Firebase AKA ADMIN JOB
  Future<void> uploadDummyData(List<CategoryModel> catagories) async {
    try {
      // Upload all categories along with the Image
      final storage = Get.put(CFirebaseStorageServices());

      // loop through each categories
      for (var category in catagories) {
        // Get Image data link from the local Asset
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload image and get its URL
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        // Assing URL to Category Image attributes
        category.image = url;

        // Store Category in FireStore
        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
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
