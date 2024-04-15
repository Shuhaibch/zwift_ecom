import 'package:ecommerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/signup_terms_and_condition.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_string.dart';
import 'package:ecommerce/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CSignupForm extends StatelessWidget {
  const CSignupForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          //* First Name and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      CValidator.validateEmptyText('First Name', value),
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
                  controller: controller.lastName,
                  validator: (value) =>
                      CValidator.validateEmptyText('Last Name', value),
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
            controller: controller.userName,
            validator: (value) =>
                CValidator.validateEmptyText('User Name', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: CText.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: CSizes.spaceBtwInputFeild,
          ),

          //* Email
          TextFormField(
            controller: controller.email,
            validator: (value) => CValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: CText.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: CSizes.spaceBtwInputFeild,
          ),

          //* Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => CValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: CText.phoneNumber, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: CSizes.spaceBtwInputFeild,
          ),

          //* Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => CValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: CText.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye))),
            ),
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
              onPressed: () => controller.signup(),
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
