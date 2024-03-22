import 'package:default_project/data/local/local_varibalse.dart';
import 'package:flutter/cupertino.dart';

class CategoryModel {
  String categoryName;
  String docId;
  String imageUrl;
  int countProduct;

  CategoryModel({
    required this.countProduct,
    required this.categoryName,
    required this.docId,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      countProduct: getCount(json['doc_id'] as String? ?? ""),
      categoryName: json['category_name'] as String? ?? "",
      docId: json['doc_id'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_name': categoryName,
      'doc_id': docId,
      'image_url': imageUrl,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      'category_name': categoryName,
      'image_url': imageUrl,
    };
  }

  CategoryModel copyWith(
      {String? categoryName,
      String? docId,
      String? imageUrl,
      int? countProduct}) {
    return CategoryModel(
      countProduct: countProduct ?? this.countProduct,
      categoryName: categoryName ?? this.categoryName,
      docId: docId ?? this.docId,
      imageUrl: imageUrl ?? this.imageUrl,
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
