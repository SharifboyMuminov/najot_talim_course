class SearchModel {
  final int id;
  final String title;

  SearchModel({required this.id, required this.title});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "No Data :(",
    );
  }

  SearchModel copyWith({
    int? id,
    String? title,
  }) {
    return SearchModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toJson() => {"title": title};
}
