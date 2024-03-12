import 'package:ecommerce/commen/widgets/custom_shapes/container/circular_containers.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:ecommerce/util/constants/colors.dart';
import 'package:flutter/material.dart';

class CPrimaryHeaderContainer extends StatelessWidget {
  const CPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CCurvedWidgets(
      child: Container(
        height: 370,
        color: CColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CCircularContainer(
                backgroundColor: CColors.textWhiteColor.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CCircularContainer(
                backgroundColor: CColors.textWhiteColor.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
