import 'package:ecommerce/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CSocialButton extends StatelessWidget {
  const CSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //* Google Icom
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: CColors.greyColor),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: CSizes.iconMd,
              height: CSizes.iconMd,
              image: AssetImage(CIMages.google),
            ),
          ),
        ),
        const SizedBox(
          width: CSizes.spaceBtwItem,
        ),
        //* Facebook icon
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: CColors.greyColor),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: CSizes.iconMd,
              height: CSizes.iconMd,
              image: AssetImage(CIMages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
