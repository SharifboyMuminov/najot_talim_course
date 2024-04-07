import 'dart:convert';

import 'package:default_project/data/models/product/product_model.dart';
import 'package:default_project/utils/app_cpntans.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/network_response.dart';
// import 'package:http/http.dart' as http;

class ApiProvider {
  Future<NetworkResponse> getAllProduct() async {
    Dio dio = Dio();
    NetworkResponse networkResponse = NetworkResponse();
    // Uri uri = Uri.https(AppContans.baseUrl, "/api/v1/products");
    try {
      Response response = await dio.get(
        "https://crudapi.co.uk/api/v1/products",
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppContans.token}",
            "Content-Type": "application/json",
          },
        ),
      );
      // http.Response response = await http.get(
      //   uri,
      //   headers: {
      //     "Authorization": "Bearer ${AppContans.token}",
      //     "Content-Type": "application/json",
      //   },
      // );

      if (response.statusCode == 200) {
        // debugPrint(response.data["items"].toString());
        networkResponse.data = (response.data["items"] as List?)
                ?.map((e) => ProductModul.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      debugPrint(error.toString());

      networkResponse.errorText = "Cath";
    }

    return networkResponse;
  }

  Future<NetworkResponse> updateProduct(ProductModul productModel) async {
    // Uri uri = Uri.https(AppContans.baseUrl, "/api/v1/products");
    Dio dio = Dio();
    try {
      Response response = await dio.put(
        "https://crudapi.co.uk/api/v1/products",
        data: jsonEncode([productModel.toJson()]),
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppContans.token}",
            "Content-Type": "application/json"
          },
        ),
      );
      // http.Response response = await http.put(
      //   uri,
      //   headers: {
      //     "Authorization": "Bearer ${AppContans.token}",
      //     "Content-Type": "application/json",
      //   },
      //   body: jsonEncode([productModel.toJson()]),
      // );
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

  Future<NetworkResponse> addProduct(ProductModul productModel) async {
    // Uri uri = Uri.https(AppContans.baseUrl, "/api/v1/products");
    Dio dio = Dio();

    try {
      Response response = await dio.post(
        "https://crudapi.co.uk/api/v1/products",
        data: jsonEncode([productModel.toJson()]),
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppContans.token}",
            "Content-Type": "application/json"
          },
        ),
      );
      // http.Response response = await http.post(
      //   uri,
      //   headers: {
      //     "Authorization": "Bearer ${AppContans.token}",
      //     "Content-Type": "application/json",
      //   },
      //   body: jsonEncode([productModel.toJsonForAdd()]),
      // );
      if (response.statusCode == 201) {
        return NetworkResponse(data: "Product added successfully!");
      }
      return NetworkResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Future<NetworkResponse> deleteProduct(String productUUID) async {
    // Uri uri = Uri.https(AppContans.baseUrl, "/api/v1/products");
    Dio dio = Dio();

    try {
      Response response = await dio.delete(
        "https://crudapi.co.uk/api/v1/products",
        data: jsonEncode([
          {"_uuid": productUUID}
        ]),
        options: Options(
          headers: {
            "Authorization": "Bearer ${AppContans.token}",
            "Content-Type": "application/json"
          },
        ),
      );
      // http.Response response = await http.delete(
      //   uri,
      //   headers: {
      //     "Authorization": "Bearer ${AppContans.token}",
      //     "Content-Type": "application/json",
      //   },
      //   body: jsonEncode([
      //     {"_uuid": productUUID}
      //   ]),
      // );
      if (response.statusCode == 200) {
        return NetworkResponse(data: "Product deleted successfully!");
      }
      return NetworkResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
