import 'package:ecommerce/commen/widgets/images/c_circular_image.dart';
import 'package:ecommerce/features/personalization/screens/profile/profile_screen.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CUserProfileTile extends StatelessWidget {
  const CUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CCircularImage(
          image: CIMages.user, height: 50, width: 50, padding: 0),
      title: Text(
        "Shuhaib CH",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: CColors.whiteColor),
      ),
      subtitle: Text(
        "Shuhaib@gmail.com",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: CColors.whiteColor),
      ),
      trailing: IconButton(
          onPressed: () => Get.to(() => const ProfileScreen()),
          icon: const Icon(
            Iconsax.edit,
            color: CColors.whiteColor,
          )),
    );
  }
}
