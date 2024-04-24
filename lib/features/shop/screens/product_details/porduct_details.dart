import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_atributes.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_rate_share_widget.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce/utils/constants/enum.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* Product Image Slider
            CImageSlider(product: product),

            //* Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: CSizes.defaultSpace,
                left: CSizes.defaultSpace,
                bottom: CSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //* Rating and Share Button
                  const CRatingAndShare(),

                  //* Price, Title, Stock, & Brand
                  CProductMetaData(product: product),
                  const SizedBox(height: CSizes.spaceBtwItem / 1.5),

                  //* Product Atributes
                  if (product.productType != ProductType.single.toString())
                    CProductAtributes(product: product),
                  if (product.productType == ProductType.single.toString())
                    const SizedBox(height: CSizes.spaceBtwSection),

                  //* Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(height: CSizes.spaceBtwSection),

                  //* Description
                  const CSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: CSizes.spaceBtwItem),
                  const ReadMoreText(
                    'Declaration of Importer: Direct import by the individual customerMarketed by: Nike Global Trading B.V. Singapore Branch, 30 Pasir Panjang Road, #10-31/32, Mapletree Business City, Singapore 117 440 Net Quantity: 1 Pair',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //* Reviews
                  const Divider(),

                  const SizedBox(height: CSizes.spaceBtwItem),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CSectionHeading(
                          title: "Review (199)", showActionButton: true),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      )
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwSection),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
