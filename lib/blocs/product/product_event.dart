import 'package:default_project/data/models/product/product_model.dart';

abstract class ProductEvent {}

class UpdateProduct extends ProductEvent {
  ProductModul productModl;

  UpdateProduct({required this.productModl});
}

class DeleteProduct extends ProductEvent {
  ProductModul productModel;

  DeleteProduct({required this.productModel});
}

class InsertProduct extends ProductEvent {
  ProductModul productModel;

  InsertProduct({required this.productModel});
}

class CallProduct extends ProductEvent {}
