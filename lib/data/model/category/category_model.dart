import 'package:default_project/data/local/local_varibalse.dart';
import 'package:flutter/cupertino.dart';

class CategoryModel {
  final String categoryName;
  final String docId;
  final String imageUrl;
  final int countProduct;
  final String storagePath;

  CategoryModel({
    required this.storagePath,
    required this.countProduct,
    required this.categoryName,
    required this.docId,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      countProduct: 0,
      categoryName: json['category_name'] as String? ?? "",
      docId: json['doc_id'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      storagePath: json['storage_path'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'storage_path': storagePath,
      'category_name': categoryName,
      'doc_id': docId,
      'image_url': imageUrl,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      'storage_path': storagePath,
      'category_name': categoryName,
      'image_url': imageUrl,
    };
  }

  CategoryModel copyWith({
    String? categoryName,
    String? docId,
    String? imageUrl,
    int? countProduct,
    String? storagePath,
  }) {
    return CategoryModel(
      countProduct: countProduct ?? this.countProduct,
      categoryName: categoryName ?? this.categoryName,
      docId: docId ?? this.docId,
      imageUrl: imageUrl ?? this.imageUrl,
      storagePath: storagePath ?? this.storagePath,
    );
  }
}

int getCount(String docId) {
  int count = 0;
  for (var product in globalProducts) {
    debugPrint("Hi");

    if (product.categoryId == docId) {
      count++;
    }
  }
  return count;
}
