
import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CCuponCode extends StatelessWidget {
  const CCuponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    
    return CRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? CColors.darkColor : CColors.whiteColor,
      padding: const EdgeInsets.only(
          top: CSizes.sm, bottom: CSizes.sm, left: CSizes.md, right: CSizes.sm),
      child: Row(
        children: [
          //* TextFeild
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          //* Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark
                        ? CColors.whiteColor.withOpacity(0.5)
                        : CColors.darkColor.withOpacity(0.5),
                    backgroundColor: CColors.greyColor.withOpacity(0.2),
                    side: BorderSide(color: CColors.greyColor.withOpacity(.1))),
                onPressed: () {},
                child: const Text('Apply')),
          )
        ],
      ),
    );
  }
}
