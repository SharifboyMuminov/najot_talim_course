import 'dart:convert';
import 'dart:io';
import 'package:default_project/data/models/state/state_model.dart';
import 'package:default_project/data/models/user/user_model.dart';
import '../models/network_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<NetworkResponse> getAllUsers() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http.get(
        Uri.parse("https://fifth-exam.free.mockoapp.net/users"),
      );

      if (response.statusCode == HttpStatus.ok) {
        networkResponse.data = (jsonDecode(response.body) as List?)
                ?.map((e) => UserModel.fromJson(e))
                .toList() ??
            [];
      } else {}
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> getAllState() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http.get(
        Uri.parse("https://restcountries.com/v3.1/all"),
      );

      if (response.statusCode == HttpStatus.ok) {
        networkResponse.data = (jsonDecode(response.body) as List?)
                ?.map((e) => StateModel.fomJson(e))
                .toList() ??
            [];
      } else {}
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }
}
