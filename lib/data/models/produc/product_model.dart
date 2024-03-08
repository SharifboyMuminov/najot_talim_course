class ProductModel {
  final int id;
  final int categoryId;
  final String name;
  final double price;
  final String imageUrl;

  ProductModel(
      {required this.id,
      required this.imageUrl,
      required this.categoryId,
      required this.name,
      required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] as int? ?? 1,
      imageUrl: json["image_url"] as String? ?? "",
      categoryId: json["category_id"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      price: (json["price"] as num? ?? 0).toDouble(),
    );
  }
}

