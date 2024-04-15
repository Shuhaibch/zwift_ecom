// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/shimmer/shimmer_loader.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CVerticalProductShimmer extends StatelessWidget {
  const CVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return CGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            CShimmerEffect(width: 180, height: 180),
            SizedBox(height: CSizes.spaceBtwItem),

            // Text
            CShimmerEffect(width: 160, height: 15),
            SizedBox(height: CSizes.spaceBtwItem / 2),
            CShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
