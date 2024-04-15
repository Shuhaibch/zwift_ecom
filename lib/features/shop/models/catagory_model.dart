// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parendId;
  bool isFeatured;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parendId = '',
    required this.isFeatured,
  });

  //* empty helper funtion
  static CategoryModel empty() => CategoryModel(
      id: '', name: '', image: '', parendId: '', isFeatured: false);

  //* Convert Model to json structure
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parendId,
      'IsFeatured': isFeatured,
    };
  }

  //* Map json oriented document sanpShot from firebase to UserModel
  factory CategoryModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map json to the Model
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        parendId: data['ParendId'] ?? '',
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
