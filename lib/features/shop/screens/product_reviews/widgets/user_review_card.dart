import 'package:ecommerce/commen/widgets/custom_shapes/container/rounded_cotainer.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/rating_star.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFuntions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(CIMages.userProfile1)),
                const SizedBox(width: CSizes.spaceBtwItem),
                Text('John k', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItem),

        //* Review
        Row(
          children: [
            const CRatingBarIndicator(rating: 4),
            const SizedBox(width: CSizes.spaceBtwItem),
            Text('01 Feb, 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItem),

        const ReadMoreText(
          'The Product was super Comfy and affordable and high in quality, dertailing was good, loved it, Product delivery was fast and good service. happy to shop',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' Show more',
          trimExpandedText: ' Less',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: CSizes.spaceBtwItem),

        //* Campany Review

        CRoundedContainer(
          backgroundColor: dark ? CColors.darkerGreyColor : CColors.greyColor,
          child: Padding(
            padding: EdgeInsets.all(CSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nike Official",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text("02 Feb, 2024",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: CSizes.spaceBtwItem),
                const ReadMoreText(
                  'The Product was super Comfy and affordable and high in quality, dertailing was good, loved it, Product delivery was fast and good service. happy to shop',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Less',
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: CSizes.spaceBtwSection)
      ],
    );
  }
}
