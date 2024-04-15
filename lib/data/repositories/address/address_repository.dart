import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repositories/authentication/authenticatoin_repostory.dart';
import 'package:ecommerce/features/personalization/models/address_modek.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  //* variables
  final _db = FirebaseFirestore.instance;

  //* Fetch user address
  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find the user information. Try again in few minutes';
      }
      final result = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();
      return result.docs
          .map((documnetSnapshot) =>
              AddressModel.fromDocumentSnapShot(documnetSnapshot))
          .toList();
    } catch (e) {
      throw ' Something went wrong while fetching Address Information, Try again later.';
    }
  }
}
