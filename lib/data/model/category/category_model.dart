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
      countProduct: json["count_product"] as int? ?? 0,
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


  CategoryModel copyWith({
    String? categoryName,
    String? docId,
    String? imageUrl,
    int? countProduct
  }) {
    return CategoryModel(
      countProduct: countProduct ?? this.countProduct,
      categoryName: categoryName ?? this.categoryName,
      docId: docId ?? this.docId,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
