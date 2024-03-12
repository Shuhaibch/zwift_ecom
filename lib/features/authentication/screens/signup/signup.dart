import 'package:ecommerce/commen/widget_login_signup/form_devider.dart';
import 'package:ecommerce/commen/widget_login_signup/social_button.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* Title
              Text(
                CText.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSection,
              ),

              //* Form
              const CSignupForm(),

              //* Divider
              CFormDevider(
                deviderText: CText.orSignUpWith.capitalize!,
              ),
              const SizedBox(
                height: CSizes.spaceBtwSection,
              ),

              //* Social Button
              const CSocialButton(),
              const SizedBox(
                height: CSizes.spaceBtwSection,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
