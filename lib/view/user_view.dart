import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/model/user/user_model.dart';
import 'package:default_project/utils/app_contans.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  List<UserModel> users = [];
  bool _loading = false;

  bool get loading => _loading;

  Future<void> getUsers() async {
    _notfication(true);
    try {
      FirebaseFirestore.instance
          .collection(AppConstants.userTable)
          .get()
          .then((value) {
        // value.docs.map((e) {
        //   debugPrint(e.toString());
        // });
        users = value.docs.map((e) => UserModel.fromJson(e.data())).toList();
      });
      _notfication(false);
    } on FirebaseException catch (_) {
      _notfication(false);
    } catch (_) {
      _notfication(false);
    }
  }

  _notfication(bool v) {
    _loading = v;
    notifyListeners();
  }
}
