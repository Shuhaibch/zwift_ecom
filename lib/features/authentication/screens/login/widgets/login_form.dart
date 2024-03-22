import 'package:ecommerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class CLoginForm extends StatelessWidget {
  const CLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSection),
        child: Column(
          children: [
            //* Emoil
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.direct_right,
                ),
                labelText: CText.email,
              ),
            ),
            const SizedBox(
              height: CSizes.spaceBtwInputFeild,
            ),

            //* Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.password_check,
                ),
                labelText: CText.password,
                suffixIcon: Icon(
                  Iconsax.eye_slash,
                ),
              ),
            ),
            const SizedBox(
              height: CSizes.spaceBtwInputFeild / 2,
            ),

            //* Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* Remember Me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text(
                      CText.rememberMe,
                    )
                  ],
                ),

                //* Forget Password
                TextButton(
                  onPressed: () =>Get.to(()=>const ForgetPasswordScreen()),
                  child: const Text(
                    CText.forgetPassword,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: CSizes.spaceBtwSection,
            ),

            //* Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(()=> const NavigationMenu()),
                child: const Text(
                  CText.signIn,
                ),
              ),
            ),
            const SizedBox(
              height: CSizes.spaceBtwItem,
            ),

            //* Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(
                  CText.createAccount,
                ),
              ),
            ),
            const SizedBox(
              height: CSizes.spaceBtwSection,
            ),
          ],
        ),
      ),
    );
  }
}
