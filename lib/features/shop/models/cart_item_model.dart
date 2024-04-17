// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;
  CartItemModel({
    required this.productId,
    this.title = '',
    this.price = 0,
    this.image,
    required this.quantity,
    this.variationId = '',
    this.brandName,
    this.selectedVariation,
  });

  //* Empty cart
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  CartItemModel copyWith({
    String? productId,
    String? title,
    double? price,
    String? image,
    int? quantity,
    String? variationId,
    String? brandName,
    Map<String, String>? selectedVariation,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      variationId: variationId ?? this.variationId,
      brandName: brandName ?? this.brandName,
      selectedVariation: selectedVariation ?? this.selectedVariation,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'] as String,
      title: json['title'] as String,
      price: json['price'] as double,
      image: json['image'] != null ? json['image'] as String : null,
      quantity: json['quantity'] as int,
      variationId: json['variationId'] as String,
      brandName: json['brandName'] != null ? json['brandName'] as String : null,
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, String>.from(
              (json['selectedVariation'] as Map<String, String>))
          : null,
    );
  }

  // String toJson() => json.encode(toJson());

  // factory CartItemModel.fromJson(String source) =>
  //     CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartItemModel(productId: $productId, title: $title, price: $price, image: $image, quantity: $quantity, variationId: $variationId, brandName: $brandName, selectedVariation: $selectedVariation)';
  }

  @override
  bool operator ==(covariant CartItemModel other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.title == title &&
        other.price == price &&
        other.image == image &&
        other.quantity == quantity &&
        other.variationId == variationId &&
        other.brandName == brandName &&
        mapEquals(other.selectedVariation, selectedVariation);
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        title.hashCode ^
        price.hashCode ^
        image.hashCode ^
        quantity.hashCode ^
        variationId.hashCode ^
        brandName.hashCode ^
        selectedVariation.hashCode;
  }
}
