import 'package:default_project/data/models/network_response.dart';
import 'package:default_project/data/models/state/state_model.dart';
import 'package:default_project/data/repository/state_repository.dart';
import 'package:flutter/material.dart';

class StateView extends ChangeNotifier {
  List<StateModel> states = [];
  StateRepository stateRepository;
  String errorText = "";

  StateView({required this.stateRepository}) {
    _getAllData();
  }

  Future<void> _getAllData() async {
    NetworkResponse networkResponse = await stateRepository.getAllState();
    if (networkResponse.errorText.isNotEmpty) {
      errorText = networkResponse.errorText;
    }

    if (networkResponse.data != null) {
      states = networkResponse.data! as List<StateModel>;
    }
    notifyListeners();
  }
}
