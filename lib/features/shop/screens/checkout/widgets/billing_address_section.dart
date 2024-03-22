import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CBillingAddressSection extends StatelessWidget {
  const CBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CSectionHeading(
            title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text("Shuhaib Ch", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: CSizes.spaceBtwItem / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: CSizes.spaceBtwItem),
            Text("+91 8989658743",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItem / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: CSizes.spaceBtwItem),
            Text("Malappuram, Kolar, Kottapadi, Kerala, India",
                style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          ],
        ),
      ],
    );
  }
}
