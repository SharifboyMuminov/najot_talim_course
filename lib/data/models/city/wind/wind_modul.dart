class WindModul {
  final double speed;
  final int deg;

  WindModul({required this.deg, required this.speed});

  factory WindModul.fromJson(Map<String, dynamic> json) {
    return WindModul(
        deg: json["deg"] as int? ?? 0, speed: json["speed"] as double? ?? 0.0);
  }
}
