import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/utils/app_contans.dart';
import 'package:default_project/view/authe_view.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  List<ProductModel> products = [];

  bool _loading = false;
  bool _error = false;

  bool get loading => _loading;

  bool get error => _error;

  Future<void> getProducts() async {
    _notefication(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.productTableName)
        .get()
        .then((value) {
      products =
          value.docs.map((e) => ProductModel.fromJson(e.data())).toList();
      debugPrint(products.toString());
    });
    globalProducts = products;
    _notefication(false);
  }

  Future<void> insertProducts(BuildContext context,
      {required ProductModel productModel}) async {
    try {
      _notefication(true);

      var cf = await FirebaseFirestore.instance
          .collection(AppConstants.productTableName)
          .add(productModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppConstants.productTableName)
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

  void testInsert(
    BuildContext context, {
    required String nameProduct,
    required String genderProduct,
    required String imageUrl,
    required String phoneNumber,
    required String price,
    required String rate,
    required String categoryId,
    required String description,
  }) {
    if (nameProduct.isEmpty ||
        genderProduct.isEmpty ||
        categoryId.isEmpty ||
        imageUrl.isEmpty ||
        phoneNumber.isEmpty ||
        price.isEmpty ||
        rate.isEmpty || description.isEmpty) {
      debugPrint("ASDF");
      noteficationError(true);
      return;
    }
    for (var i in globalCategories) {
      if (i.categoryName == categoryId) {
        categoryId = i.docId;
      }
    }
    try {
      ProductModel productModel = ProductModel(
        description:description,
        gender: genderProduct,
        nameProduct: nameProduct,
        categoryId: categoryId,
        docId: '',
        imageUrl: imageUrl,
        price: num.parse(price),
        rate: num.parse(rate),
        phoneNumber: phoneNumber,
      );
      insertProducts(context, productModel: productModel);
    } catch (e) {
      showSnackBarMy(context, "Error type :(");
    }
  }

  Future<void> deleteProduct(BuildContext context,
      {required ProductModel productModel}) async {
    try {
      _notefication(true);
      await FirebaseFirestore.instance
          .collection(AppConstants.productTableName)
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

  noteficationError(bool v) {
    _error = v;
    notifyListeners();
  }

  _notefication(bool v) {
    _loading = v;
    notifyListeners();
  }
}
