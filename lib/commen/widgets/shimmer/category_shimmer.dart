import 'package:ecommerce/commen/widgets/shimmer/shimmer_loader.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CCategoryShimmer extends StatelessWidget {
  const CCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(width: CSizes.spaceBtwItem),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              CShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: CSizes.spaceBtwItem / 2),

              // text
              CShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
