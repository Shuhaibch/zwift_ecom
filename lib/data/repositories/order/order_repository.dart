import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repositories/authentication/authenticatoin_repostory.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  //* Variable
  final _db = FirebaseFirestore.instance;

  /*-------------------------Functions------------------------------*/

  //* Get all order related to current User
  Future<List<OrderModel>> fetchUserOrder() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;

      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes,';
      }

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching Order information. Try again later.';
    }
  }

  //* Store new user order
  Future<void> saveOrder(OrderModle orderm, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving Order information. Try again later.';
    }
  }
}
