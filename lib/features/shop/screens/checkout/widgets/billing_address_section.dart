import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/personalization/controller/address_controller.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CBillingAddressSection extends StatelessWidget {
  const CBillingAddressSection({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CSectionHeading(
            title: 'Shipping Address',
            buttonTitle: 'Change',
            onPressed: () => controller.selectNewAddressPopup(context)),
        controller.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.selectedAddress.value.name,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: CSizes.spaceBtwItem / 2),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey, size: 16),
                      const SizedBox(width: CSizes.spaceBtwItem),
                      Text(controller.selectedAddress.value.phoneNumber,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwItem / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_history,
                          color: Colors.grey, size: 16),
                      const SizedBox(width: CSizes.spaceBtwItem),
                      Text(controller.selectedAddress.value.postalCode,
                          style: Theme.of(context).textTheme.bodyMedium,
                          softWrap: true),
                    ],
                  ),
                ],
              )
            : Text('Select Address',
                style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
