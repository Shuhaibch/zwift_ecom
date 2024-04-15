import 'package:ecommerce/data/repositories/address/address_repository.dart';
import 'package:ecommerce/features/personalization/models/address_modek.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  //* variable
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  //* Fetch all user specific address
  Future<List<AddressModel>> getAllUserAddress() async {
    try {
      final address = await addressRepository.fetchUserAddress();
      selectedAddress.value = address.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return address;
    } catch (e) {
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  //* Select new address
  // Function selectAddress(AddressModel newSelectedAddress) async {
  //   try {
  //     // clear the selected feild

  //     // Assign selected address

  //     // Set the "selected" feild to true for the newly selected address
  //   } catch (e) {
  //     CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //   }
  // }
}
