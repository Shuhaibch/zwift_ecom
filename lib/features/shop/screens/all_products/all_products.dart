import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/products/sortable/sortable_widget.dart';
import 'package:ecommerce/commen/widgets/shimmer/vertival_product_shimmer.dart';
import 'package:ecommerce/features/shop/controllers/product/all_product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen(
      {super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product getching
    final controller = Get.put(AlProductController());
    return Scaffold(
      appBar: CAppbar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = CVerticalProductShimmer();
                final widget = CCloudHelperFuntion.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;
                // product Found!
                final product = snapshot.data!;
                return CSortableProduct(products: product);
              }),
        ),
      ),
    );
  }
}
