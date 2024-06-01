import 'package:default_project/data/models/product/product_model.dart';

class CategoryModel {
  final String title;
  final List<ProductModel> products;

  CategoryModel({required this.title, required this.products});
}
