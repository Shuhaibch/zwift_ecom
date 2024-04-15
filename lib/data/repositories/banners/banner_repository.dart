import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/banner_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exception.dart';
import 'package:ecommerce/utils/exceptions/format_exception.dart';
import 'package:ecommerce/utils/exceptions/platform_exception.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //* Variable
  final _db = FirebaseFirestore.instance;

  //* fetch all Banners
  Future<List<BannerModel>> fetchBanner() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapShot(documentSnapshot))
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
}
