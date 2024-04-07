import 'package:default_project/blocs/product/product_event.dart';
import 'package:default_project/blocs/product/product_state.dart';
import 'package:default_project/data/models/network_response.dart';
import 'package:default_project/data/api_provider/api_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ApiProvider apiProvider = ApiProvider();

  ProductBloc() : super(Loading()) {
    on<CallProduct>(_callProducts);
    on<DeleteProduct>(_deleteProduct);
    on<UpdateProduct>(_updateProduct);
    on<InsertProduct>(_insertProduct);
  }

  _callProducts(CallProduct callProduct, Emitter<ProductState> emit) async {
    emit(Loading());
    debugPrint("asdfasdf");
    NetworkResponse networkResponse = await apiProvider.getAllProduct();
    if (networkResponse.errorText.isNotEmpty) {
      emit(Error(errorText: "Error"));
    } else {
      emit(QueryOk(products: networkResponse.data));
    }
  }

  _deleteProduct(
      DeleteProduct deleteProduct, Emitter<ProductState> emit) async {
    emit(Loading());
    NetworkResponse networkResponse =
        await apiProvider.deleteProduct(deleteProduct.productModel.prodictId);
    if (networkResponse.errorText.isNotEmpty) {
      emit(Error(errorText: "Error update"));
    } else {
      add(CallProduct());
    }
  }

  _updateProduct(
      UpdateProduct updateProduct, Emitter<ProductState> emit) async {
    emit(Loading());
    NetworkResponse networkResponse =
        await apiProvider.updateProduct(updateProduct.productModl);
    if (networkResponse.errorText.isNotEmpty) {
      emit(Error(errorText: networkResponse.errorText));
    } else {
      add(CallProduct());
    }
  }

  _insertProduct(
      InsertProduct insertProduct, Emitter<ProductState> emit) async {
    emit(Loading());
    NetworkResponse networkResponse =
        await apiProvider.addProduct(insertProduct.productModel);
    if (networkResponse.errorText.isNotEmpty) {
      emit(Error(errorText: "Error update"));
    } else {
      add(CallProduct());
    }
  }
}
