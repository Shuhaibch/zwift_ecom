import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/features/shop/controllers/product/order_controller.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class COrderListItems extends StatelessWidget {
  const COrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          // Nothing found Widget,
          final emtyWidget = CAnimationLoaderWidget(
            text: 'Whoops! No order yet!',
            animation: CIMages.lottieSignup,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
            showAction: true,
          );

          // Helper funtion to handle loader , no record, error
          final responce = CCloudHelperFuntion.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emtyWidget);
          if (responce != null) return responce;

          //  Responce found
          final orders = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true,
            itemCount: orders.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: CSizes.spaceBtwItem),
            itemBuilder: (_, index) {
              final order = orders[index];
              return CRoundedContainer(
                
                padding: const EdgeInsets.all(CSizes.md),
                showBorder: true,
                backgroundColor: dark ? CColors.darkColor : CColors.lightColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //* Row 1
                    Row(
                      children: [
                        //* Icon
                        const Icon(Iconsax.ship),
                        const SizedBox(width: CSizes.spaceBtwItem / 2),

                        //* status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.orderStatusText,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                        color: CColors.primaryColor,
                                        fontSizeDelta: 1),
                              ),
                              Text(order.formattedOrderDate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Iconsax.arrow_right_34,
                                size: CSizes.iconSm)),
                      ],
                    ),
                    const SizedBox(height: CSizes.spaceBtwItem),
                    //* Row 2
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              //* Icon
                              const Icon(Iconsax.ship),
                              const SizedBox(width: CSizes.spaceBtwItem / 2),

                              //* status & Date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Order',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    Text(order.id,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        //* Row inside row
                        Expanded(
                          child: Row(
                            children: [
                              //* Icon
                              const Icon(Iconsax.calendar),
                              const SizedBox(width: CSizes.spaceBtwItem / 2),

                              //* status & Date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Shipping Date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    Text(order.formattedDeliveryDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
