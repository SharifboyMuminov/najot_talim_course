import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/model/messeg/message_model.dart';
import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/utils/app_contans.dart';
import 'package:default_project/view/authe_view.dart';
import 'package:default_project/view/request_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/local_notification_service.dart';
import 'message_view.dart';

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
    // debugPrint(docId);
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
      LocalNotificationService.localNotificationService.showNotification(
          title: 'Malumot Qoshildi :)',
          body: productModel.nameProduct,
          id: idContLocal);
      idContLocal++;


      if (!context.mounted) return;



      showSnackBarMy(context, "Malumot saqlandi :)", Colors.black45);

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
      LocalNotificationService.localNotificationService.showNotification(
          title: 'Malumot Yngilandi',
          body: productModel.nameProduct,
          id: idContLocal);
      idContLocal++;



      if (!context.mounted) return;

      showSnackBarMy(context, "Malumot yangilandi :)", Colors.black26);
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

  Future<void> testInsert(
    BuildContext context, {
    required String nameProduct,
    required String genderProduct,
    required String imageUrl,
    required String phoneNumber,
    required String price,
    required String rate,
    required String categoryId,
    required String description,
    bool request = false,
    ProductModel? productModelKegan,
  }) async {
    if (nameProduct.isEmpty ||
        genderProduct.isEmpty ||
        categoryId.isEmpty ||
        imageUrl.isEmpty ||
        phoneNumber.isEmpty ||
        price.isEmpty ||
        rate.isEmpty ||
        description.isEmpty) {
      // debugPrint("ASDF");
      noteficationError(true);
      return;
    }
    // bZh5ZkMDE0OKnQ4NlnAC
    for (var i in globalCategories) {
      // debugPrint("Hello");

      if (i.categoryName == categoryId) {
        categoryId = i.docId;
      }
    }
    // debugPrint(categoryId);

    try {
      if (productModelKegan != null) {
        productModelKegan = productModelKegan.copyWith(
          description: description,
          gender: genderProduct,
          nameProduct: nameProduct,
          categoryId: categoryId,
          docId: productModelKegan.docId,
          imageUrl: imageUrl,
          price: num.parse(price),
          rate: num.parse(rate),
          phoneNumber: phoneNumber,
        );
        if (request) {
          context
              .read<RequestViewModel>()
              .updateProduct(context, productModel: productModelKegan);
        } else {
          updateProduct(context, productModel: productModelKegan);
        }
      } else {
        ProductModel productModel = ProductModel(
          emailReques: "",
          description: description,
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
      }
    } catch (e) {
      showSnackBarMy(context, "Error type :(");
      return;
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
      LocalNotificationService.localNotificationService.showNotification(
          title: 'Malumot o\'chirildi ',
          body: productModel.nameProduct,
          id: idContLocal);
      idContLocal++;

      if (!context.mounted) return;


      showSnackBarMy(context, "Malumot O'chirildi :)");
    } on FirebaseException catch (_) {
      _notefication(false);
      if (!context.mounted) return;

      showSnackBarMy(context, "Error data base :(");
    } catch (_) {
      _notefication(false);
      if (!context.mounted) return;

      showSnackBarMy(context, "Error connect :(");
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
