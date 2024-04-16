import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/personalization/controller/address_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar:
          const CAppbar(title: Text("Add new Address"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      CValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.user,
                    ),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFeild),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => CValidator.validatePhoneNumber(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.mobile,
                    ),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFeild),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            CValidator.validateEmptyText('Street', value),
                        controller: controller.street,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.building_31,
                          ),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFeild),
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            CValidator.validateEmptyText('Postal Code', value),
                        controller: controller.postalCode,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.code,
                          ),
                          labelText: 'Postal Code',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CSizes.spaceBtwInputFeild),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            CValidator.validateEmptyText('City', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.building,
                          ),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFeild),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) =>
                            CValidator.validateEmptyText('State', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.activity,
                          ),
                          labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CSizes.spaceBtwInputFeild),
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      CValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.global,
                    ),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(height: CSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.addNewAddresses(),
                      child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
