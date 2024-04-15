
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:flutter/material.dart';

class COverallProductRating extends StatelessWidget {
  const COverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text('4.8',
                style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              CRatingProgessIndicator(text: '5', value: 1),
              CRatingProgessIndicator(text: '4', value: .8),
              CRatingProgessIndicator(text: '3', value: .6),
              CRatingProgessIndicator(text: '2', value: .4),
              CRatingProgessIndicator(text: '1', value: .2),
            ],
          ),
        )
      ],
    );
  }
}
