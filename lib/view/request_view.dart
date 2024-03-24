import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/local/local_varibalse.dart';
import 'package:flutter/material.dart';

import '../data/model/product/produc_model.dart';
import '../utils/app_contans.dart';
import '../widget/show_snacbar.dart';

class RequestViewModel extends ChangeNotifier {
  List<ProductModel> requestProduct = [];
  bool _loading = false;

  get loading => _loading;

  Future<void> getProducts() async {
    _notefication(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.productRequestTableName)
        .get()
        .then((value) {
      requestProduct =
          value.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    });
    _notefication(false);
  }

  _notefication(bool v) {
    _loading = v;
    notifyListeners();
  }

  Future<void> insertProducts(BuildContext context,
      {required ProductModel productModel}) async {
    try {
      _notefication(true);

      var cf = await FirebaseFirestore.instance
          .collection(AppConstants.productRequestTableName)
          .add(productModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppConstants.productRequestTableName)
          .doc(cf.id)
          .update({"doc_id": cf.id});
      getProducts();
      if (!context.mounted) return;
      Navigator.pop(context);
      _notefication(false);
    } on FirebaseException catch (_) {
      _notefication(false);

      if (!context.mounted) return;
      showSnackBarMy(context, "on FirebaseException catch insertCategory");
    } catch (_) {
      _notefication(false);

      if (!context.mounted) return;
      showSnackBarMy(context, " catch insertCategory");
    }
  }

  Future<void> updateProduct(BuildContext context,
      {required ProductModel productModel}) async {
    _notefication(true);
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.productTableName)
          .doc(productModel.docId)
          .update(productModel.toJson());
      _notefication(false);
      getProducts();

      if (!context.mounted) return;

      showSnackBarMy(context, "Malumot yangilandi :)");
    } on FirebaseException catch (_) {
      _notefication(false);

      if (!context.mounted) return;

      showSnackBarMy(context, "on FirebaseException catch (_)");
      return;
    } catch (_) {
      _notefication(false);

      if (!context.mounted) return;
      showSnackBarMy(context, "catch (_)");
      return;
    }
  }



  Future<void> deleteProduct(BuildContext context,
      {required ProductModel productModel}) async {
    try {
      _notefication(true);
      await FirebaseFirestore.instance
          .collection(AppConstants.productRequestTableName)
          .doc(productModel.docId)
          .delete();
      getProducts();
      _notefication(false);
      if (!context.mounted) return;

      showSnackBarMy(context, "Malumot O'chirildi :)", Colors.transparent);
    } on FirebaseException catch (_) {
      _notefication(false);
      if (!context.mounted) return;

      showSnackBarMy(context, "Error data base :(", Colors.transparent);
    } catch (_) {
      _notefication(false);
      if (!context.mounted) return;

      showSnackBarMy(context, "Error connect :(", Colors.transparent);
    }
  }
}