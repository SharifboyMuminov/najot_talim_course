class FavoriteModel {
  final int id;

  FavoriteModel({required this.id});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(id: json["_id"] as int? ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
    };
  }

  FavoriteModel copyWith({int? id}) {
    return FavoriteModel(id: id ?? this.id);
  }
}
