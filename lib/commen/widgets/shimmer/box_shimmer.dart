import 'package:ecommerce/commen/widgets/shimmer/shimmer_loader.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CBoxesShimmer extends StatelessWidget {
  const CBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: CShimmerEffect(width: 150, height: 110)),
            SizedBox(width: CSizes.spaceBtwItem),
            Expanded(child: CShimmerEffect(width: 150, height: 110)),
            SizedBox(width: CSizes.spaceBtwItem),
            Expanded(child: CShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
