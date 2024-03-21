import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/model/category/category_model.dart';
import 'package:default_project/utils/app_contans.dart';
import 'package:default_project/view/authe_view.dart';
import 'package:flutter/cupertino.dart';

class CategoryViewModel extends ChangeNotifier {
  List<CategoryModel> categories = [];

  bool _loading = false;

  bool get loading => _loading;

  Future<void> getCategories() async {
    _notefication(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.categoryTableName)
        .get()
        .then((value) {
      categories =
          value.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
      debugPrint(categories.toString());

    });
    _notefication(false);
  }

  Future<void> insertCategory(BuildContext context,
      {required CategoryModel categoryModel}) async {
    try {
      _notefication(true);

      var cf = await FirebaseFirestore.instance
          .collection(AppConstants.categoryTableName)
          .add(categoryModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppConstants.categoryTableName)
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
