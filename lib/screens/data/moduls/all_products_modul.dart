class AllProductModul {
  final int id;
  final int categoryId;
  final String name;
  final int price;
  final String imageUrl;

  AllProductModul({
    required this.categoryId,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  factory AllProductModul.fromJson(Map<String, dynamic> json) {
    return AllProductModul(
      categoryId: json["category_id"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      imageUrl: json["image_url"] as String? ?? "",
      name: json["name"] as String? ?? "",
      price: json["price"] as int? ?? 0,
    );
  }
}

// {
//      "id":1,
//      "category_id":1,
//      "name":"Macbook",
//       "price":1200,
//      "image_url":"https://cdn.arstechnica.net/wp-content/uploads/2021/10/16-inch-MacBook-Pro-open.jpeg"
//    },