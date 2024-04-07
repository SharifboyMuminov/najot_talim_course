import 'package:default_project/data/models/product/product_model.dart';

abstract class ProductState {}

class Loading extends ProductState {}

class Error extends ProductState {
  String errorText;

  Error({required this.errorText});
}

class QueryOk extends ProductState {
  List<ProductModul> products;

  QueryOk({required this.products});
}
