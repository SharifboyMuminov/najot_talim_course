import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/models/category/category_model.dart';

class BookModel {
  final String? uuid;
  final CategoryModel category;
  final String description;
  final String imageUrl;
  final String mualif;
  final String name;
  final int price;
  final String color;
  final num rate;

  BookModel({
    this.uuid,
    required this.mualif,
    required this.color,
    required this.rate,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      uuid: json['_uuid'] as String? ?? "",
      category: getCategory(json['categoriy'] as int? ?? 1),
      description: json['descreption'] as String? ?? "",
      imageUrl: json['image_url'] as String? ?? "",
      name: json['name'] as String? ?? "",
      price: (json['price'] as num? ?? 5000).toInt(),
      color: json["color"] as String? ?? "CCD3CA",
      rate: json["rate"] as num? ?? 0,
      mualif: json["mualif"] as String? ?? "Palonchi Palonchiyev",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_uuid": uuid,
      'categoriy': category.id,
      'descreption': description,
      'image_url': imageUrl,
      'name': name,
      'price': price,
      'color': color,
      'rate': rate,
      'mualif': mualif,
    };
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      'categoriy': category.id,
      'descreption': description,
      'image_url': imageUrl,
      'name': name,
      'price': price,
      'color': color,
      'rate': rate,
      'mualif': mualif,
    };
  }

  BookModel copyWithe({
    CategoryModel? category,
    String? description,
    String? imageUrl,
    String? name,
    int? price,
    String? uuid,
    String? color,
    double? rate,
    String? mualif,
  }) {
    return BookModel(
      color: color ?? this.color,
      uuid: this.uuid,
      rate: rate ?? this.rate,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      price: price ?? this.price,
      mualif: mualif ?? this.mualif,
    );
  }
}

CategoryModel getCategory(int id) {
  for (var category in categoryModels) {
    if (category.id == id) {
      return category;
    }
  }
  return categoryModels.first;
}
