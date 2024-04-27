import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/models/network_response.dart';
import 'package:default_project/data/models/user/user_model.dart';
import 'package:default_project/utils/app_cons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<List<UserModel>> {
  UserCubit() : super([]);

  Future<void> callUser() async {
    List<UserModel> users = [];

    try {
      await FirebaseFirestore.instance
          .collection(AppCons.userTableName)
          .get()
          .then((value) {
        users = value.docs.map((e) => UserModel.fromJson(e.data())).toList();
      });
    } on FirebaseException catch (_) {
      debugPrint("on FirebaseException catch (_)");
    } catch (_) {
      debugPrint("catch (_)");
    }
    emit(users);
  }

  Future<String> insertUser({required UserModel userModel}) async {
    String docId = "";
    try {
      final cf = await FirebaseFirestore.instance
          .collection(AppCons.userTableName)
          .add(userModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppCons.userTableName)
          .doc(cf.id)
          .update({"doc_id": cf.id});
      docId = cf.id;
    } on FirebaseException catch (_) {
      debugPrint("on FirebaseException catch (_)");
    } catch (_) {
      debugPrint("catch (_)");
    }

    return docId;
  }

  Future<NetworkResponse> getUser({required String docId}) async {
    NetworkResponse networkResponse = NetworkResponse();

    await FirebaseFirestore.instance
        .collection(AppCons.userTableName)
        .doc(docId)
        .get()
        .then((value) {
      if (value.data() != null) {
        networkResponse.data = UserModel.fromJson(value.data()!);
      }
    });

    return networkResponse;
  }

  UserModel? containsUser(
      {required String fullName, required String password}) {
    List<UserModel> users = state;

    for (UserModel userModel in users) {
      if (userModel.password == password && userModel.fullName == fullName) {
        return userModel;
      }
    }

    return null;
  }

  bool toResembleUser({required String password}) {
    List<UserModel> users = state;

    for (UserModel userModel in users) {
      if (userModel.password == password) {
        return true;
      }
    }

    return false;
  }
}
