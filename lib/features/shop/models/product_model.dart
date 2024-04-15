// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  String title;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;
  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    required this.title,
    this.productAttributes,
    this.productVariations,
  });

  //* Empty func
  static ProductModel empty() => ProductModel(
      id: '',
      stock: 0,
      price: 0,
      salePrice: 0,
      thumbnail: '',
      productType: '',
      title: '');

  //* ToJson
  toJson() {
    return {
      ['Id']: id,
      ['Stock']: stock,
      ['Price']: price,
      ['SalePrice']: salePrice,
      ['Thumbnail']: thumbnail,
      ['ProductType']: productType,
      ['Brand']: brand!.toJson(),
      ['CategoryId']: categoryId,
      ['Date']: date,
      ['Description']: description,
      ['Images']: images ?? [],
      ['IsFeatured']: isFeatured,
      ['ProductAttributes']: productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      ['ProductVariations']: productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
      ['SKU']: sku,
      ['Title']: title,
    };
  }

  //* From json
  factory ProductModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();

    final data = document.data()!;
    return ProductModel(
        title: data['Title'] ?? '',
        id: document.id,
        stock: data['Stock'] ?? 0,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        productType: data['ProductType'] ?? '',
        brand: BrandModel.fromJson(data['Brand']),
        categoryId: data['CategoryId'] ?? '',
        date: data['Date'] ?? DateTime.now(),
        description: data['Description'] ?? '',
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        isFeatured: data['IsFeatured'] ?? false,
        sku: data['SKU'] ?? '',
        productAttributes: (data['ProductAttributes'] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromJson(e))
            .toList(),
        productVariations: (data['ProductVariations'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromJson(e))
            .toList());
  }

  //* Map Json oriented document snapShot from firebase to model
  factory ProductModel.fromQuerySnapShot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;

    return ProductModel(
        title: data['Title'] ?? '',
        id: document.id,
        stock: data['Stock'] ?? 0,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        productType: data['ProductType'] ?? '',
        brand: BrandModel.fromJson(data['Brand']),
        categoryId: data['CategoryId'] ?? '',
        date: data['Date'] ?? DateTime.now(),
        description: data['Description'] ?? '',
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        isFeatured: data['IsFeatured'] ?? false,
        sku: data['SKU'] ?? '',
        productAttributes: (data['ProductAttributes'] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromJson(e))
            .toList(),
        productVariations: (data['ProductVariations'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromJson(e))
            .toList());
  }

  //* Map Json oriented document snapShot from firebase to model
  factory ProductModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;

    return ProductModel(
        title: data['Title'] ,
        id: document.id,
        stock: data['Stock'] ?? 0,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        productType: data['ProductType'] ?? '',
        brand: BrandModel.fromJson(data['Brand']),
        categoryId: data['CategoryId'] ?? '',
        date: data['Date'] ?? DateTime.now(),
        description: data['Description'] ?? '',
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        isFeatured: data['IsFeatured'] ?? false,
        sku: data['SKU'],
        productAttributes: (data['ProductAttributes'] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromJson(e))
            .toList(),
        productVariations: (data['ProductVariations'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromJson(e))
            .toList());
  }
}
