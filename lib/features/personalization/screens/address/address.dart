import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/personalization/controller/address_controller.dart';
import 'package:ecommerce/features/personalization/screens/address/add_new_address_screen.dart';
import 'package:ecommerce/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          () => const AddNewAddressScreen(),
        ),
        backgroundColor: CColors.primaryColor,
        child: const Icon(
          Iconsax.add,
          color: CColors.whiteColor,
        ),
      ),
      appBar: CAppbar(
        showBackArrow: true,
        title:
            Text("Address", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Obx(
            ()=> FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddress(),
              builder: (context, snapshot) {
                // Helper funtion to check the error
                final response =
                    CCloudHelperFuntion.checkMultiRecordState(snapshot: snapshot);
                if (response != null) return response;
            
                // fetch data success
                final addresses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    return CSingleAddress(address: addresses[index], onTap: () => controller.selectAddress(addresses[index]),
                        // controller.selectAddress(addresses[index])
                        );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
