
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class CLoginHeader extends StatelessWidget {
  const CLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
            dark ? CIMages.lightAppLogo : CIMages.darkAppLogo,
          ),
        ),
        Text(
          CText.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: CSizes.sm,
        ),
        Text(
          CText.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
