import 'dart:convert';

import 'package:default_project/data/models/categoriy/categori_model.dart';
import 'package:default_project/data/models/produc/product_model.dart';

import '../models/network_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<NetworkResponse> getAllCategory() async {
    NetworkResponse networkResponse = NetworkResponse();
    http.Response response;

    try {
      response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/categories"));

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode((response.body)) as List?)
                ?.map((e) => CategoryModel.fromJson(e))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "Error Else";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  Future<NetworkResponse> getProducts(int categoryId) async {
    NetworkResponse networkResponse = NetworkResponse();

    http.Response response;

    try {
      response = await http.get(Uri.parse(
          "https://imtixon.free.mockoapp.net/categories/$categoryId"));

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode((response.body)) as List?)
                ?.map((e) => ProductModel.fromJson(e))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "Error else";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }
}
