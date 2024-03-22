import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CSingleAddress extends StatelessWidget {
  const CSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return CRoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(CSizes.md),
      showBorder: true,
      backgroundColor: selectedAddress
          ? CColors.primaryColor.withOpacity(.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? CColors.darkerGreyColor
              : CColors.greyColor,
      margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItem),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? CColors.lightColor
                      : CColors.darkColor
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CSizes.sm / 2),
              const Text('+91 2659884546',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: CSizes.sm / 2),
              const Text(
                  '85785 , HP Road, Near hpTower, Kottapadi, Malappuram, Kerala, India',
                  softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}
