class FeelsLikeModul {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLikeModul({
    required this.day,
    required this.eve,
    required this.morn,
    required this.night,
  });

  factory FeelsLikeModul.fromJson(Map<String, dynamic> json) {
    return FeelsLikeModul(
      day: json["day"] as double? ?? 0.0,
      eve: json["eve"] as double? ?? 0.0,
      morn: json["morn"] as double? ?? 0.0,
      night: json["night"] as double? ?? 0.0,
    );
  }
}

// "day": 274.62,
// "night": 274.05,
// "eve": 275.3,
// "morn": 274.15