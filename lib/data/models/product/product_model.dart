class ProductModul {
  final String prodictId;
  final String prodctName;
  final String decoretion;
  final double price;
  final String imageUrl;

  ProductModul({
    required this.decoretion,
    required this.imageUrl,
    required this.price,
    required this.prodctName,
    required this.prodictId,
  });

  factory ProductModul.fromJson(Map<String, dynamic> json) {
    return ProductModul(
      decoretion: json["decreption"] as String? ?? "",
      imageUrl: json["iamge_url"] as String? ?? "",
      price: (json["price"] as num? ?? 0.0).toDouble(),
      prodctName: json["product_name"] as String? ?? "",
      prodictId: json["_uuid"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "decreption": decoretion,
      "iamge_url": imageUrl,
      "price": price,
      "product_name": prodctName,
    };
  }

  ProductModul copyWithe({
    String? prodctName,
    String? decoretion,
    double? price,
    String? imageUrl,
  }) {
    return ProductModul(
      decoretion: decoretion ?? this.decoretion,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      prodctName: prodctName ?? this.prodctName,
      prodictId: prodictId,
    );
  }
}
