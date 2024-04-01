class CountryContinentModel {
  final String code;
  final String name;

  CountryContinentModel({
    required this.code,
    required this.name,
  });

  factory CountryContinentModel.fromJson(Map<String, dynamic> json) {
    return CountryContinentModel(
      code: json['code'] ?? "",
      name: json['name'] ?? "",
    );
  }
}