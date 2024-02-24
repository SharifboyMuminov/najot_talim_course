class TempModul {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  TempModul(
      {required this.day,
      required this.eve,
      required this.max,
      required this.min,
      required this.morn,
      required this.night});

  factory TempModul.fromJson(Map<String, dynamic> json) {
    return TempModul(
      day: json["day"] as double? ?? 0.0,
      eve: json["eve"] as double? ?? 0.0,
      max: json["max"] as double? ?? 0.0,
      min: json["min"] as double? ?? 0.0,
      morn: json["morn"] as double? ?? 0.0,
      night: json["night" as double? ?? 0.0],
    );
  }
}

// "day": 274.62,
// "min": 274.05,
// "max": 275.3,
// "night": 274.05,
// "eve": 275.3,
// "morn": 274.15