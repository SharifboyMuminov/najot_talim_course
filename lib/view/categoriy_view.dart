import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/model/category/category_model.dart';
import 'package:default_project/utils/app_contans.dart';
import 'package:default_project/view/authe_view.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  List<CategoryModel> categories = [];

  bool _loading = false;
  bool _error = false;

  bool get loading => _loading;

  bool get err => _error;

  Future<void> getCategories() async {
    _notefication(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.categoryTableName)
        .get()
        .then((value) {
      categories =
          value.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
      globalCategories = categories;
    });
    _notefication(false);
  }

  Future<void> _insertCategory(BuildContext context,
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
      if (!context.mounted) return;

      Navigator.pop(context);
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

  insertTest(
    BuildContext context, {
    required String nameCategory,
    required String imageUrl,
  }) {
    if (imageUrl.isEmpty || nameCategory.isEmpty) {
      showSnackBarMy(context, "Empty Input :|");
      noteficationError(true);
      return;
    }
    _insertCategory(
      context,
      categoryModel: CategoryModel(
        countProduct: 0,
        categoryName: nameCategory,
        docId: "",
        imageUrl: imageUrl,
      ),
    );
  }

  Future<void> deleteCategory(BuildContext context,
      {required String docId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.categoryTableName)
          .doc(docId)
          .delete();
      getCategories();

      if (!context.mounted) return;
      showSnackBarMy(context, "data deleted successfully :)", Colors.grey);
    } on FirebaseException catch (_) {
      if (!context.mounted) return;
      showSnackBarMy(context, "Error on FirebaseException catch");
    } catch (_) {
      if (!context.mounted) return;
      showSnackBarMy(context, "Error connect");
    }
  }

  _notefication(bool v) {
    _loading = v;
    notifyListeners();
  }

  noteficationError(bool v) {
    _error = v;
    notifyListeners();
  }
}
