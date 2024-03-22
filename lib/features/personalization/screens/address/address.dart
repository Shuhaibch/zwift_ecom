import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/personalization/screens/address/add_new_address_screen.dart';
import 'package:ecommerce/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              CSingleAddress(selectedAddress: false),
              CSingleAddress(selectedAddress: false),
              CSingleAddress(selectedAddress: false),
              CSingleAddress(selectedAddress: true),
              CSingleAddress(selectedAddress: false),
              CSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
