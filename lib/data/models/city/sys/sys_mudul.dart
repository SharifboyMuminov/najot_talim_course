class SysModul {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  SysModul(
      {required this.country,
      required this.id,
      required this.sunrise,
      required this.sunset,
      required this.type});

  factory SysModul.fromJson(Map<String, dynamic> json) {
    return SysModul(
      country: json["country"] as String? ?? "",
      id: json["id"] as int? ?? 0,
      sunrise: json["sunrise"] as int? ?? 0,
      sunset: json["sunset"] as int? ?? 0,
      type: json["type"] as int? ?? 0,
    );
  }
}