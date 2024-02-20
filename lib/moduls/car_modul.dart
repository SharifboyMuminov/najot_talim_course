class CarModul {
  final int id;
  final String carModel;
  final int averagePrice;
  final String logo;
  final int establishedYear;

  CarModul({
    required this.averagePrice,
    required this.carModel,
    required this.establishedYear,
    required this.id,
    required this.logo,
  });

  factory CarModul.fromJson(Map<String, dynamic> json) {
    return CarModul(
      averagePrice: json["average_price"] as int? ?? 0,
      carModel: json["car_model"] as String? ?? "Null",
      establishedYear: json["established_year"] as int? ?? 2002,
      id: json["id"] as int? ?? 0,
      logo: json["logo"] as String? ?? "Null",
    );
  }
}
