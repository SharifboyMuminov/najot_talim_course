class WeatherModul {
  final int id;
  final String maiN;
  final String description;
  final String icon;

  WeatherModul({
    required this.description,
    required this.icon,
    required this.id,
    required this.maiN,
  });

  factory WeatherModul.fromJson(Map<String, dynamic> json) {
    return WeatherModul(
      description: json["description"] as String? ?? "",
      icon: json["icon"] as String? ?? "",
      id: json["id"] as int? ?? 0,
      maiN: json["main"] as String? ?? "",
    );
  }
}

