class RegionModel {
  final String regionName;
  final int id;

  RegionModel({required this.regionName, required this.id});

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      regionName: json["name"] as String? ?? "No Name :)",
      id: json["id"] as int? ?? 0,
    );
  }
}
