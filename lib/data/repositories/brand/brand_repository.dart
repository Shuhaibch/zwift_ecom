import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exception.dart';
import 'package:ecommerce/utils/exceptions/format_exception.dart';
import 'package:ecommerce/utils/exceptions/platform_exception.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  //* variable
  final _db = FirebaseFirestore.instance;

  //* Get All Brands
  Future<List<BrandModel>> getAllBrand() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapShot(e)).toList();
      return result;
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

  //* Get Brands for categories
  Future<List<BrandModel>> getBrandForCategories(String catagoryId) async {
    try {
      //  Query to get all the document where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection("BrandCategory")
          .where('categoryId', isEqualTo: catagoryId)
          .get();

      // extract brandid from the document
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();

      // query to get all documents where the brenaId is int he list of brandIds, FeildPath.documetId to query document in collection.
      final brandQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();
      // extract brand names or other relevent data from the document
      List<BrandModel> brands =
          brandQuery.docs.map((doc) => BrandModel.fromSnapShot(doc)).toList();
      return brands;
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
