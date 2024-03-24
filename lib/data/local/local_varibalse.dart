import 'package:default_project/data/model/category/category_model.dart';
import 'package:default_project/data/model/product/produc_model.dart';
import 'package:flutter/animation.dart';

List<CategoryModel> globalCategories = [];
List<ProductModel> globalProducts = [];
late AnimationController globalAnimationController;
String emailUser = "";