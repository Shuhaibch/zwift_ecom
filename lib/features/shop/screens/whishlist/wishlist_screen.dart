import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/icons/c_curcular_icon.dart';
import 'package:ecommerce/commen/widgets/layout/grid_layout.dart';
import 'package:ecommerce/commen/widgets/products/product_card/product_card_vertical.dart';
import 'package:ecommerce/commen/widgets/shimmer/vertival_product_shimmer.dart';
import 'package:ecommerce/features/shop/controllers/product/favorite_controllers.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:ecommerce/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoritesController.instance;
    return Scaffold(
      appBar: CAppbar(
        title: Text('Whishlist',
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CCircularIcon(
            icon: Iconsax.add,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => FutureBuilder(
                    future: controller.favoriteProducts(),
                    builder: (context, snapshot) {
                      // nothing found
                      final emptyWidget = CAnimationLoaderWidget(
                        text: 'Whoops! Whishlist is Empty..',
                        animation: CIMages.emptyWhishlistLotties,
                        actionText: 'Let\'s add some',
                        showAction: true,
                        onActionPressed: () =>
                            Get.off(() => const NavigationMenu()),
                      );
                      const loader = CVerticalProductShimmer(itemCount: 6);
                      final widget = CCloudHelperFuntion.checkMultiRecordState(
                          snapshot: snapshot,
                          loader: loader,
                          nothingFound: emptyWidget);

                      if (widget != null) return widget;

                      // fetched data
                      final products = snapshot.data!;

                      return CGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => CProductCardVertical(
                          product: products[index],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
