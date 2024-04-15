import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/images/c_circular_image.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/personalization/controller/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

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
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : CIMages.user;
                      return CCircularImage(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
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
                  onPressed: () => Get.to(() => const CChangeNameScreen()),
                  title: "Name",
                  value: controller.user.value.fullName),
              CProfileMenu(
                  onPressed: () => Get.to(() => const CChangeNameScreen()),
                  title: "UserName",
                  value: controller.user.value.username),

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
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              CProfileMenu(
                  onPressed: () {},
                  title: "E-mail",
                  value: controller.user.value.email),
              CProfileMenu(
                  onPressed: () {},
                  title: "Phone Number",
                  value: controller.user.value.phoneNumber),
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
                  onPressed: () => controller.deleteAccountWarningPopup(),
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
