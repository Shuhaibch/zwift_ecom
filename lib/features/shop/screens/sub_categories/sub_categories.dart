import 'package:ecommerce/commen/widgets/appbar/appbar.dart';
import 'package:ecommerce/commen/widgets/images/c_rounded_images.dart';
import 'package:ecommerce/commen/widgets/products/product_card/product_card_horizontal.dart';
import 'package:ecommerce/commen/widgets/text/section_heading.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              //* Banner
              CRoundedImage(
                  imageUrl: CIMages.promoBanner1,
                  width: double.infinity,
                  applyImageRadius: true),
              SizedBox(height: CSizes.spaceBtwSection),

              //* sub-catagories
              Column(
                children: [
                  //* Heading
                  CSectionHeading(title: 'Sports shirt', onPressed: () {}),
                  SizedBox(height: CSizes.spaceBtwItem / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: CSizes.spaceBtwItem),
                        itemBuilder: (context, index) =>
                            CProductCardHorizontal()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
