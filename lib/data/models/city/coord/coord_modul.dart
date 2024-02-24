class CoordModul {
  final double lon;
  final double lat;

  CoordModul({required this.lat, required this.lon});

  factory CoordModul.fromJson(Map<String, dynamic> json) {
    return CoordModul(
      lat: json["lat"] as double? ?? 0.0,
      lon: json["lon"] as double? ?? 0.0,
    );
  }
}

