import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const CAppbar(title: Text("Add new Address"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.user,
                    ),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFeild),
                TextFormField(
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
                      onPressed: () {}, child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
