import 'package:ecommerce/util/constants/colors.dart';
import 'package:flutter/material.dart';

class CCircularContainer extends StatelessWidget {
  const CCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor = CColors.whiteColor,
     this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final EdgeInsets? margin;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
