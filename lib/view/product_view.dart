import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/model/category/category_model.dart';
import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/utils/app_contans.dart';
import 'package:default_project/view/authe_view.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel extends ChangeNotifier {
  List<ProductModel> products = [];

  bool _loading = false;

  bool get loading => _loading;

  Future<void> getCategories() async {
    _notefication(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.productTableName)
        .get()
        .then((value) {
      products =
          value.docs.map((e) => ProductModel.fromJson(e.data())).toList();
      debugPrint(products.toString());
    });
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
      getCategories();
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

  _notefication(bool v) {
    _loading = v;
    notifyListeners();
  }
}
