class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  // json format
  toJson() {
    return {'Name': name, 'Values': values};
  }

  // from Json
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name:data.containsKey('Name')?  data["Name"]:'',
      values: List<String>.from(data['Values']),
    );
  }
}
