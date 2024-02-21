class CategoryInfoModul {
  final int id;
  final int categoryId;
  final String name;
  final int price;
  final String imageUrl;
  final String description;

  CategoryInfoModul({
    required this.categoryId,
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  factory CategoryInfoModul.fromJson(Map<String, dynamic> json) {
    return CategoryInfoModul(
      categoryId: json["category_id"] as int? ?? 0,
      description: json["description"] as String? ?? "",
      id: json["id"] as int? ?? 0,
      imageUrl: json["image_url"] as String? ?? "",
      name: json["name"] as String? ?? "",
      price: json["price"] as int? ?? 0,
    );
  }
}
