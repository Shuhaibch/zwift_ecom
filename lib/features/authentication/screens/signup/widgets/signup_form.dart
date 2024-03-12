import 'package:ecommerce/features/authentication/screens/signup/verifty_email_screen.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/signup_terms_and_condition.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CSignupForm extends StatelessWidget {
  const CSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          //* First Name and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: CText.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: CSizes.spaceBtwInputFeild,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: CText.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: CSizes.spaceBtwInputFeild,
          ),

          //* Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: CText.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: CSizes.spaceBtwInputFeild,
          ),

          //* Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: CText.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: CSizes.spaceBtwInputFeild,
          ),

          //* Phone Number
          TextFormField(
            decoration: const InputDecoration(
                labelText: CText.phoneNumber, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: CSizes.spaceBtwInputFeild,
          ),

          //* Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                labelText: CText.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(
            height: CSizes.spaceBtwInputFeild,
          ),

          //* Terms & Condition CheckBox
          const CTermAndConditions(),
          const SizedBox(
            height: CSizes.spaceBtwSection,
          ),

          //* Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(CText.createAccount),
            ),
          ),
          const SizedBox(
            height: CSizes.spaceBtwSection,
          ),
        ],
      ),
    );
  }
}
