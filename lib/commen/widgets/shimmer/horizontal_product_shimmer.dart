import 'package:ecommerce/commen/widgets/shimmer/shimmer_loader.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CHorizontalProductShimmer extends StatelessWidget {
  const CHorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: CSizes.spaceBtwSection),
      height: 120,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image
                  CShimmerEffect(width: 120, height: 120),
                  SizedBox(width: CSizes.spaceBtwItem),

                  // Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: CSizes.spaceBtwItem / 2),
                      CShimmerEffect(width: 160, height: 15),
                      SizedBox(height: CSizes.spaceBtwItem / 2),
                      CShimmerEffect(width: 110, height: 15),
                      SizedBox(height: CSizes.spaceBtwItem / 2),
                      CShimmerEffect(width: 80, height: 15),
                      Spacer(),
                    ],
                  )
                ],
              ),
          separatorBuilder: (context, index) =>
              const SizedBox(width: CSizes.spaceBtwItem),
          itemCount: itemCount),
    );
  }
}
