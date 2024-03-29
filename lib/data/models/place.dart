import 'package:default_project/utils/app_constans.dart';

class PlaceModel {
  final double lat;
  final double long;
  final String title;
  final String category;
  final String imagePath;
  final int? id;

  PlaceModel({
    this.id,
    required this.lat,
    required this.long,
    required this.title,
    required this.category,
    required this.imagePath,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json["id"] as int?,
      lat: double.parse(json[AppCon.lat as String? ?? "0"]),
      long: double.parse(json[AppCon.long as String? ?? "0"]),
      title: json[AppCon.title] as String?  ?? 'Null',
      category: json[AppCon.category] as String?  ?? 'Null',
      imagePath: json[AppCon.imagePth] as String?  ?? 'Null',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppCon.lat: lat.toString(),
      AppCon.long: long.toString(),
      AppCon.title: title,
      AppCon.category: category,
      AppCon.imagePth: imagePath,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "id": id,
      'lat': lat,
      'long': long,
      'title': title,
      'category': category,
      'image_pth': imagePath,
    };
  }

  PlaceModel copyWith({
    int? id,
    double? lat,
    double? long,
    String? title,
    String? category,
    String? imagePath,
  }) {
    return PlaceModel(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      title: title ?? this.title,
      category: category ?? this.category,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
