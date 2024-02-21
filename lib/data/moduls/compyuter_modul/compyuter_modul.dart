class CompyuterModel {
  final int id;
  final int categoryId;
  final int price;
  final String name;
  final String imageUrl;

  CompyuterModel({
    required this.categoryId,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  factory CompyuterModel.fromJson(Map<String, dynamic> json) {
    return CompyuterModel(
      categoryId: json["category_id"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      imageUrl: json["image_url"] as String? ?? "",
      name: json["name"] as String? ?? "",
      price: json["price"] as int? ?? 0,
    );
  }
}

