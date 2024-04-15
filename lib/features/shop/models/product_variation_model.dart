// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, dynamic> attributeValues;
  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.00,
    this.salePrice = 0.00,
    this.stock = 0,
    required this.attributeValues,
  });

  //* Ceate Empty function
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  // * to Json
  toJson() {
    return {
      'Id': id,
      'Description': description,
      'Image': image,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  //* from Json
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? '',
      description: data['Description'] ?? '',
      image: data['Image'] ?? '',
      price: double.parse((data['Price'] ?? '').toString()),
      salePrice: double.parse((data['SalePrice'] ?? '').toString()),
      sku: data['SKU'] ?? '',
      stock: data['Stock'] ?? 0,
      attributeValues: Map<String, dynamic>.from(data['AttributeValues']),
    );
  }
}
