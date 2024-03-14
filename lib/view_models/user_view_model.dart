import 'package:default_project/data/models/network_response.dart';
import 'package:default_project/data/models/user/user_model.dart';
import 'package:default_project/data/repository/user_repository.dart';
import 'package:flutter/material.dart';

class UserView extends ChangeNotifier {
  List<UserModel> users = [];
  UserRepository userRepository;

  UserView({required this.userRepository}) {
    _getAllData();
  }

  Future<void> _getAllData() async {
    NetworkResponse networkResponse = await userRepository.getAllUser();

    if (networkResponse.data != null) {
      users = networkResponse.data! as List<UserModel>;
    }
    notifyListeners();
  }
}
