class CarInfoModul {
  final int id;
  final String carModel;
  final String logo;
  final int establishedYear;
  final int averagePrice;
  final String description;
  final List<String> carPics;

  CarInfoModul({
    required this.averagePrice,
    required this.carModel,
    required this.carPics,
    required this.description,
    required this.establishedYear,
    required this.id,
    required this.logo,
  });

  factory CarInfoModul.fromJson(Map<String, dynamic> json) {
    return CarInfoModul(
      averagePrice: json["average_price"] as int? ?? 0,
      carModel: json["car_model"] as String? ?? "Null",
      carPics:
          (json["car_pics"] as List?)?.map((e) => e.toString()).toList() ?? [],
      description: json["description"] as String? ?? "Null",
      establishedYear: json["established_year"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      logo: json["logo"] as String? ?? "",
    );
  }
}
