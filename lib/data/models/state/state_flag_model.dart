class StateFlagModel {
  final String png;
  final String svg;
  final String alt;

  StateFlagModel({
    required this.png,
    required this.svg,
    required this.alt,
  });

  factory StateFlagModel.fromJson(Map<String, dynamic> json) {
    return StateFlagModel(
      png: json['png'] as String? ?? "",
      svg: json['svg'] as String? ?? "",
      alt: json['alt'] as String? ?? "",
    );
  }
}