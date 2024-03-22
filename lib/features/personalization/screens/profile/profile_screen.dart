import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/images/c_circular_image.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* appbar
      appBar: const CAppbar(showBackArrow: true, title: Text("Profile")),

      //* body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              //* Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CCircularImage(
                        image: CIMages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Change Profile Picture"))
                  ],
                ),
              ),

              //* Details
              const SizedBox(height: CSizes.spaceBtwItem / 2),
              const Divider(),
              const SizedBox(height: CSizes.spaceBtwItem),

              //* Heading Profile Info
              const CSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: CSizes.spaceBtwItem),

              CProfileMenu(
                  onPressed: () {}, title: "Name", value: "Shuhaib CH"),
              CProfileMenu(
                  onPressed: () {}, title: "UserName", value: "shuhaib_ch"),

              const SizedBox(height: CSizes.spaceBtwItem / 2),
              const Divider(),
              const SizedBox(height: CSizes.spaceBtwItem),

              //* Heading Personal Info
              const CSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: CSizes.spaceBtwItem),

              //*
              CProfileMenu(
                onPressed: () {},
                title: "User ID",
                value: "123546",
                icon: Iconsax.copy,
              ),
              CProfileMenu(
                  onPressed: () {}, title: "E-mail", value: "shuhaibch"),
              CProfileMenu(
                  onPressed: () {}, title: "Phone Number", value: "9874563210"),
              CProfileMenu(onPressed: () {}, title: "Gender", value: "Male"),
              CProfileMenu(
                  onPressed: () {},
                  title: "Data of Birth",
                  value: "12 Oct 1999"),
              const Divider(),
              const SizedBox(height: CSizes.spaceBtwItem),

              //* Close Account
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
