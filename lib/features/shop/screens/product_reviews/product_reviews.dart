import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/overall_rating_progress_indicator.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/rating_star.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* AppBar
      appBar:
          const CAppbar(title: Text('Review & Ratings'), showBackArrow: true),

      //* Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and revies are verified and from people who use the same type of device that you use.'),
              const SizedBox(height: CSizes.spaceBtwItem),

              //* Overall product ratings
              const COverallProductRating(),

              const CRatingBarIndicator(rating: 4.5),
              Text('23,312', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: CSizes.spaceBtwSection),

              //* User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
