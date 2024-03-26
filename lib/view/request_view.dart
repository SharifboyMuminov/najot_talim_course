import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/local/local_varibalse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/messeg/message_model.dart';
import '../data/model/product/produc_model.dart';
import '../services/local_notification_service.dart';
import '../utils/app_contans.dart';
import '../widget/show_snacbar.dart';
import 'message_view.dart';

class RequestViewModel extends ChangeNotifier {
  List<ProductModel> requestProduct = [];
  bool _loading = false;

  get loading => _loading;

  Stream<List<ProductModel>> listenRequestProduct() => FirebaseFirestore
      .instance
      .collection(AppConstants.productRequestTableName)
      .snapshots()
      .map(
        (event) =>
            event.docs.map((doc) => ProductModel.fromJson(doc.data())).toList(),
      );

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

  Future<void> updateProduct(BuildContext context,
      {required ProductModel productModel}) async {
    _notefication(true);
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.productRequestTableName)
          .doc(productModel.docId)
          .update(productModel.toJson());
      _notefication(false);
      getProducts();
      LocalNotificationService.localNotificationService.showNotification(
          title: 'Malumot Yngilandi',
          body: productModel.nameProduct,
          id: idContLocal);

      if (!context.mounted) return;
      context.read<MessageViewModel>().addMessage(
          messageModel: MessageModel(
              name: '${productModel.nameProduct}  Malumot yangilandi :)',
              id: idContLocal));
      idContLocal++;

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
      LocalNotificationService.localNotificationService.showNotification(
          title: "Malumot o'chirildi",
          body: productModel.nameProduct,
          id: idContLocal);
      idContLocal++;



      idContLocal++;
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
