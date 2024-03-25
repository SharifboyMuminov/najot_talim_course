import 'package:default_project/data/model/category/category_model.dart';
import 'package:default_project/data/model/messeg/message_model.dart';
import 'package:default_project/data/model/product/produc_model.dart';
import 'package:flutter/animation.dart';

List<CategoryModel> globalCategories = [];
List<ProductModel> globalProducts = [];
// List<MessageModel> globalMessage = [];
late AnimationController globalAnimationController;
int idContLocal = 1;