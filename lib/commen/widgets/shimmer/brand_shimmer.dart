import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/shimmer/shimmer_loader.dart';
import 'package:flutter/material.dart';

class CBrandShimmer extends StatelessWidget {
  const CBrandShimmer({super.key, required this.itemCount});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return CGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const CShimmerEffect(width: 300, height: 80),
    );
  }
}
