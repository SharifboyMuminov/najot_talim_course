import 'package:default_project/data/local/local_variables/local_variables.dart';
import 'package:default_project/data/models/categoriy/categoriy_modul.dart';

class CoffeModul {
  int? id;
  final String name;
  final String descreption;
  final String subTitle;
  final num price;
  final String sizeDish;
  final int count;
  final String imageUr;
  bool isFavorite;
  final CagetegoriyModul cagetegoriyModul;

  CoffeModul({
    this.id,
    this.isFavorite = false,
    required this.imageUr,
    required this.count,
    required this.cagetegoriyModul,
    required this.descreption,
    required this.name,
    required this.price,
    required this.sizeDish,
    required this.subTitle,
  });

  factory CoffeModul.fromJson(Map<String, dynamic> json) {
    return CoffeModul(
      isFavorite: getisFavorite(json[CoffeModulContans.isFavorite] as String? ?? "true"),
      id: json[CoffeModulContans.id],
      count: json[CoffeModulContans.count] as int? ?? 0,
      cagetegoriyModul:
          _getCategory(json[CoffeModulContans.cagetegoriyModul] as int? ?? 1),
      descreption: json[CoffeModulContans.descreption] as String? ?? "",
      name: json[CoffeModulContans.name] as String? ?? "",
      price: json[CoffeModulContans.price] as num? ?? 0,
      sizeDish: json[CoffeModulContans.sizeDish] as String? ?? "",
      subTitle: json[CoffeModulContans.subTitle] as String? ?? "",
      imageUr: json[CoffeModulContans.imageUr] as String? ??
          "https://static.onecms.io/wp-content/uploads/sites/19/2009/12/21/chocolate-cappucino-ck-x.jpg",
    );
  }

  Map<String, dynamic> toJsonFavorute() {
    return {
      CoffeModulContans.descreption: descreption.toString(),
      CoffeModulContans.imageUr: imageUr.toString(),
      CoffeModulContans.isFavorite: isFavorite.toString(),
      CoffeModulContans.name: name.toString(),
      CoffeModulContans.cagetegoriyModul: cagetegoriyModul.id,
      CoffeModulContans.price: price.toInt(),
      CoffeModulContans.subTitle: subTitle.toString(),
    };
  }

  CoffeModul copyWithe(
      {String? name,
      String? descreption,
      num? price,
      CagetegoriyModul? cagetegoriyModul,
      int? count,
      String? sizeDish,
      String? subTitle,
      String? imageUrl}) {
    return CoffeModul(
      count: count ?? this.count,
      cagetegoriyModul: cagetegoriyModul ?? this.cagetegoriyModul,
      descreption: descreption ?? this.descreption,
      name: name ?? this.name,
      price: price ?? this.price,
      sizeDish: sizeDish ?? this.sizeDish,
      subTitle: subTitle ?? this.subTitle,
      imageUr: imageUr ?? this.imageUr,
    );
  }

  static CoffeModul getDefault() {
    return CoffeModul(
      count: 0,
      cagetegoriyModul: categpriyes[0],
      descreption: "",
      name: "",
      price: 0,
      sizeDish: "",
      subTitle: "",
      imageUr: '',
    );
  }
}

bool getisFavorite(String text) {
  if (text == "true") return true;
  return false;
}

CagetegoriyModul _getCategory(int id) {
  switch (id) {
    case 1:
      return categpriyes[0];
    case 2:
      return categpriyes[1];
    default:
      return categpriyes[2];
  }
}

class CoffeModulContans {
  static const String tableFavorite = "favorite_table";
  static const String tableSave = "save_table";
  static const String name = "name";
  static const String id = "id";
  static const String isFavorite = "is_favorite";
  static const String descreption = "descreption";
  static const String price = "price";
  static const String sizeDish = "size_dish";
  static const String subTitle = "sub_title";
  static const String cagetegoriyModul = "cagetegoriy_modul";
  static const String count = "count";
  static const String imageUr = "image_url";
}
