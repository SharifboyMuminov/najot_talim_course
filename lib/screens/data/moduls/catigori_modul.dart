class CatigoriyModul {
  final int id;
  final String name;
  final String imageUrl;
  final String createdAt;

  CatigoriyModul({
    required this.createdAt,
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  factory CatigoriyModul.fromJson(Map<String, dynamic> json) {
    return CatigoriyModul(
      createdAt: json["created_at"] as String? ?? "",
      id: json["id"] as int? ?? 0,
      imageUrl: json["image_url"] as String? ?? "",
      name: json["name"] as String? ?? "",
    );
  }
}
