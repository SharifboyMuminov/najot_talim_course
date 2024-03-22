class ProductModel {
  String categoryId;
  String docId;
  String imageUrl;
  String nameProduct;
  num price;
  num rate;
  String phoneNumber;
  String gender;
  String description;

  ProductModel({
    required this.description,
    required this.gender,
    required this.nameProduct,
    required this.categoryId,
    required this.docId,
    required this.imageUrl,
    required this.price,
    required this.rate,
    required this.phoneNumber,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      description: json["description"] as String? ?? "",
      gender: json["gender"] as String? ?? "",
      nameProduct: json["name_product"] as String? ?? "",
      categoryId: json['category_id'] as String? ?? "",
      docId: json['doc_id'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      price: json['price'] as num? ?? 0,
      rate: json['rate'] as num? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      'category_id': categoryId,
      'gender': gender,
      'name_product': categoryId,
      'doc_id': docId,
      'image_url': imageUrl,
      'price': price,
      'rate': rate,
      'phone_number': phoneNumber,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "description": description,
      'category_id': categoryId,
      'gender': gender,
      'name_product': categoryId,
      'image_url': imageUrl,
      'price': price,
      'rate': rate,
      'phone_number': phoneNumber,
    };
  }

  ProductModel copyWith({
    String? categoryId,
    String? docId,
    String? imageUrl,
    double? price,
    double? rate,
    String? phoneNumber,
    String? gender,
    String? nameProduct,
    String? description,
  }) {
    return ProductModel(
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      docId: docId ?? this.docId,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      rate: rate ?? this.rate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      nameProduct: nameProduct ?? this.nameProduct,
      gender: gender ?? this.gender,
    );
  }
}
