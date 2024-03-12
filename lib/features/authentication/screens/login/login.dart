import 'package:ecommerce/commen/styles/spacing_styles.dart';
import 'package:ecommerce/commen/widget_login_signup/form_devider.dart';
import 'package:ecommerce/commen/widget_login_signup/social_button.dart';
import 'package:ecommerce/util/constants/sizes.dart';
import 'package:ecommerce/util/constants/text_string.dart';
import 'package:ecommerce/util/helpers/helpe_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CSpacingStyle.paddingWithAppbarStyle,
          child: Column(
            children: [
              //* Logo, Title, SubTitle
              CLoginHeader(dark: dark),

              //* Form
              const CLoginForm(),

              //* Divider
              CFormDevider( deviderText: CText.orSignInWith.capitalize!,),
              const SizedBox(
                height: CSizes.spaceBtwSection,
              ),

              //*Footer
              const CSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
