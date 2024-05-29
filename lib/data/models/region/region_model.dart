class RegionModel {
  final String regionName;

  RegionModel({required this.regionName});

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(regionName: json["name"] as String? ?? "No Name :)");
  }
}
