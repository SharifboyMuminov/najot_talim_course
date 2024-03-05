import 'dart:convert';

import 'package:default_project/data/models/product/product_model.dart';
import 'package:default_project/utils/app_cpntans.dart';

import '../models/network_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<NetworkResponse> getAllProduct() async {
    NetworkResponse networkResponse = NetworkResponse();
    Uri uri = Uri.https(AppContans.baseUrl, "/api/v1/products");

    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppContans.token}",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body)["items"] as List?)
            ?.map((e) => ProductModul.fromJson(e))
            .toList();
      }
    } catch (error) {
      networkResponse.errorText = "Cath";
    }

    return networkResponse;
  }

  Future<NetworkResponse> updateProduct(ProductModul productModel) async {
    Uri uri = Uri.https(AppContans.baseUrl, "/api/v1/products");
    try {
      http.Response response = await http.put(
        uri,
        headers: {
          "Authorization": "Bearer ${AppContans.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([productModel.toJson()]),
      );
      if (response.statusCode == 200) {
        return NetworkResponse(data: "Product updated successfully!");
      } else {
        // print("object");
      }
      return NetworkResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
