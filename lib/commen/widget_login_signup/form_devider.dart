import 'package:ecommerce/util/constants/colors.dart';
import 'package:ecommerce/util/helpers/helpe_functions.dart';
import 'package:flutter/material.dart';
class CFormDevider extends StatelessWidget {
  const CFormDevider({
    super.key,
     required this.deviderText,
  });

  final String deviderText;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? CColors.darkGreyColor : CColors.greyColor,
            thickness: 0.5,
            endIndent: 5,
            indent: 60,
          ),
        ),
        Text(
          deviderText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? CColors.darkGreyColor : CColors.greyColor,
            thickness: 0.5,
            endIndent: 60,
            indent: 5,
          ),
        )
      ],
    );
  }
}
