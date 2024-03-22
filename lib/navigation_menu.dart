import 'package:ecommerce/features/personalization/screens/settings/setting_screen.dart';
import 'package:ecommerce/features/shop/screens/home/home_screen.dart';
import 'package:ecommerce/features/shop/screens/store/store.dart';
import 'package:ecommerce/features/shop/screens/whishlist/wishlist_screen.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = CHelperFuntions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          // height: 80,
          elevation: 0,
          backgroundColor: dark ? CColors.blackColor : Colors.white,
          indicatorColor: dark
              ? CColors.whiteColor.withOpacity(0.1)
              : CColors.blackColor.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (value) =>
              controller.selectedIndex.value = value,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: 'Whishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    const SettingScreen(),
  ];
}
