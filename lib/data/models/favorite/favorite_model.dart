class FavoriteModel {
  final int id;
  final int apiId;
  FavoriteModel({required this.apiId, required this.id});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
        apiId: json["api_id"] as int? ?? 0, id: json["_id"] as int? ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {
      "api_id": apiId,
    };
  }
}
