import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CTabbar extends StatelessWidget implements PreferredSizeWidget {
  const CTabbar({
    super.key,
    required this.tabs,
  });
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return Material(
      color: dark ? CColors.blackColor : CColors.whiteColor,
      child: TabBar(
          isScrollable: true,
          indicatorColor: CColors.primaryColor,
          unselectedLabelColor: CColors.darkGreyColor,
          labelColor: CHelperFuntions.isDarkMode(context)
              ? CColors.whiteColor
              : CColors.primaryColor,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(CDeviceUtils.getAppBarHeight());
}
