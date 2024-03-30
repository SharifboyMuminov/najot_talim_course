import 'package:default_project/utils/app_constans.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final String title;
  final LatLng latLng;
  final String category;
  final String imagePath;
  final String id;

  PlaceModel({
    required this.id,
    required this.latLng,
    required this.title,
    required this.category,
    required this.imagePath,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json["doc_id"] as String? ?? "",
      latLng: LatLng(
        json[AppCon.lat] as double? ?? 0.0,
        json[AppCon.long] as double? ?? 0.0,
      ),
      title: json[AppCon.title] as String? ?? 'Null',
      category: json[AppCon.category] as String? ?? 'Null',
      imagePath: json[AppCon.imagePth] as String? ?? 'Null',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppCon.lat: latLng.latitude,
      AppCon.long: latLng.longitude,
      AppCon.title: title,
      AppCon.category: category,
      AppCon.imagePth: imagePath,
      "doc_id": id,
    };
  }

  // Map<String, dynamic> toJsonForUpdate() {
  //   return {
  //     "doc_id": id,
  //     'lat': latLng.latitude,
  //     'long': latLng.longitude,
  //     'title': title,
  //     'category': category,
  //     'image_pth': imagePath,
  //   };
  // }

  PlaceModel copyWith({
    String? id,
    String? title,
    String? category,
    String? imagePath,
    LatLng? latLng,
  }) {
    return PlaceModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      imagePath: imagePath ?? this.imagePath,
      latLng: latLng ?? this.latLng,
    );
  }
}
