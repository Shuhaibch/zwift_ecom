import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerce/commen/widgets/list_tile/settings_menu_tile.dart';
import 'package:ecommerce/commen/widgets/list_tile/user_profile_tile.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/personalization/screens/address/address.dart';
import 'package:ecommerce/features/shop/screens/cart/cart_screen.dart';
import 'package:ecommerce/features/shop/screens/order/order_screen.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* Header
            CPrimaryHeaderContainer(
              child: Column(
                children: [
                  //* Appbar
                  CAppbar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: CColors.whiteColor),
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwSection),

                  //*user Profile Card
                  const CUserProfileTile(),
                  const SizedBox(height: CSizes.spaceBtwSection),
                ],
              ),
            ),

            //* body
            Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  //* Account Settings
                  const CSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: CSizes.spaceBtwItem),

                  //* Settings Menu
                  CSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subTitle: 'Set delivery Address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  CSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  CSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subTitle: 'In progress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  CSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "My Account",
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  CSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subTitle: 'List of All the discounted coupons',
                    onTap: () {},
                  ),
                  CSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subTitle: 'Set any kind of notification messages',
                    onTap: () {},
                  ),
                  CSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subTitle: 'Manage data usage and connected Accounts',
                    onTap: () {},
                  ),

                  //* App settings
                  const SizedBox(height: CSizes.spaceBtwSection),
                  const CSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: CSizes.spaceBtwItem),
                  const CSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data on your cloud firebase',
                  ),

                  CSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set Recomendation based on location',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  CSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  CSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Upload Data on your cloud firebase',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwSection),

                  //* Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('Logout')),
                  ),
                  const SizedBox(height: CSizes.spaceBtwSection),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
