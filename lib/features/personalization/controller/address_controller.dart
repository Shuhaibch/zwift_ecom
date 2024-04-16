import 'package:ecommerce/data/repositories/address/address_repository.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/loaders/loader.dart';
import 'package:ecommerce/utils/network_manager/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  //* variable
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  RxBool refreshData = true.obs;
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

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
  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      // loader
      Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const CircularProgressIndicator());
      // clear the selected feild
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedFeild(
            selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "selected" feild to true for the newly selected address
      await addressRepository.updateSelectedFeild(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //* save new Address
  Future addNewAddresses() async {
    try {
      // Start Loading
      CFullScreenLoader.openLoadingDialog(
          'Storing Address....', CIMages.emptyWhishlistLotties);

      // Check internet Connection
      final isConnect = await NetworkManager.instance.isConnected();
      if (!isConnect) {
        CFullScreenLoader.stopLoading();
        return;
      }

      // save address data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: false,
      );
      final id = await addressRepository.addAddress(address);

      // Update Selected Address Status
      address.id = id;
      selectAddress(address);

      // remove Loader
      CLoaders.successSnackBar(
          title: "Congratulations",
          message: 'Your address have been saved successfully!.');

      // Refresh address Data
      refreshData.toggle();

      // Reset feild
      resetFormFeilds();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove Looder
      CFullScreenLoader.stopLoading();
      CLoaders.errorSnackBar(title: 'Address Not Found', message: e.toString());
    }
  }

  //* function to reset form feild
  void resetFormFeilds() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
