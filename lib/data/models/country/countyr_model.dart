class Continent {
  final String name;

  Continent({required this.name});

  factory Continent.fromJson(Map<String, dynamic> json) {
    return Continent(
      name: json['name'] as String? ?? "",
    );
  }
}

class CountryModel {
  final String code;
  final String name;
  final String emoji;
  final Continent continent;

  CountryModel({
    required this.code,
    required this.name,
    required this.emoji,
    required this.continent,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'] as String? ?? "UZ",
      name: json['name'] as String? ?? "Uzbekistan",
      emoji: json['emoji'] as String? ?? "🇺🇿",
      continent: Continent.fromJson(json['continent']),
    );
  }
}
