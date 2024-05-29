class HistoryModel {
  final int id;
  final String title;

  HistoryModel({required this.id, required this.title});

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "No Data :(",
    );
  }

  HistoryModel copyWith({
    int? id,
    String? title,
  }) {
    return HistoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toJson() => {"title": title};
}
