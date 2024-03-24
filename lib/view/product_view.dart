import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/utils/app_contans.dart';
import 'package:default_project/view/authe_view.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> productsCategory = [];
  ProductModel defaultProduct = ProductModel.getDefaultProduct();

  bool _loading = false;
  bool _error = false;

  bool get loading => _loading;

  bool get error => _error;

  Future<void> getProductForId(BuildContext context,
      {required String docId}) async {
    _notefication(true);
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.productTableName)
          .doc(docId)
          .get()
          .then((value) {
        var data = value.data();
        if (data != null) {
          defaultProduct = ProductModel.fromJson(data);
        }
      });
      _notefication(false);
    } on FirebaseException catch (_) {
      _notefication(false);

      if (!context.mounted) return;

      showSnackBarMy(context, "on FirebaseException catch (_)");
    } catch (_) {
      _notefication(false);

      if (!context.mounted) return;
      showSnackBarMy(context, "catch (_)");
    }
  }

  Future<void> getProductsCategory(String docId) async {
    _notefication(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.productTableName)
        .where("category_id", isEqualTo: docId)
        .get()
        .then((value) {
      productsCategory =
          value.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    });

    _notefication(false);
  }

  Future<void> getProducts() async {
    _notefication(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.productTableName)
        .get()
        .then((value) {
      products =
          value.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    });
    globalProducts = products;
    _notefication(false);
  }

  noteficationError(bool v) {
    _error = v;
    notifyListeners();
  }

  _notefication(bool v) {
    _loading = v;
    notifyListeners();
  }
}
