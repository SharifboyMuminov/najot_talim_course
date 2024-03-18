import 'dart:convert';
import 'package:default_project/data/models/book/book_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/my_response.dart';

class ApiProvider {
  static Future<MyRespons> getAllBook() async {
    MyRespons networkResponse = MyRespons();
    Uri uri = Uri.https("crudapi.co.uk", "/api/v1/products");

    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization":
              "Bearer -HiR8E4726kmzBbUClaexQdoTKoWNkoiauJUOvbUrj3940KWSQ",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body)["items"] as List?)
            ?.map((e) => BookModel.fromJson(e))
            .toList();
      }
    } catch (error) {
      debugPrint(error.toString());

      networkResponse.errorText = "Cath";
    }

    return networkResponse;
  }

  static Future<MyRespons> addProduct({required BookModel bookModel}) async {
    Uri uri = Uri.https("crudapi.co.uk", "/api/v1/products");
    try {
      http.Response response = await http.post(
        uri,
        headers: {
          "Authorization":
              "Bearer -HiR8E4726kmzBbUClaexQdoTKoWNkoiauJUOvbUrj3940KWSQ",
          "Content-Type": "application/json",
        },
        body: jsonEncode([bookModel.toJsonAdd()]),
      );
      if (response.statusCode == 201) {
        return MyRespons(data: "Product added successfully!");
      }
      return MyRespons(errorText: response.statusCode.toString());
    } catch (error) {
      return MyRespons(errorText: error.toString());
    }
  }

  static Future<MyRespons> deleteBook(String productUUID) async {
    Uri uri = Uri.https("crudapi.co.uk", "/api/v1/products");
    try {
      http.Response response = await http.delete(
        uri,
        headers: {
          "Authorization":
              "Bearer -HiR8E4726kmzBbUClaexQdoTKoWNkoiauJUOvbUrj3940KWSQ",
          "Content-Type": "application/json",
        },
        body: jsonEncode([
          {"_uuid": productUUID}
        ]),
      );
      if (response.statusCode == 200) {
        return MyRespons(data: "Product deleted successfully!");
      }
      return MyRespons(errorText: response.statusCode.toString());
    } catch (error) {
      return MyRespons(errorText: error.toString());
    }
  }

  static Future<MyRespons> updateBook(BookModel bookModel) async {
    Uri uri = Uri.https("crudapi.co.uk", "/api/v1/products");
    try {
      http.Response response = await http.put(
        uri,
        headers: {
          "Authorization":
              "Bearer -HiR8E4726kmzBbUClaexQdoTKoWNkoiauJUOvbUrj3940KWSQ",
          "Content-Type": "application/json",
        },
        body: jsonEncode([bookModel.toJson()]),
      );
      if (response.statusCode == 200) {
        return MyRespons(data: "Product updated successfully!");
      }
      return MyRespons(errorText: response.statusCode.toString());
    } catch (error) {
      return MyRespons(errorText: error.toString());
    }
  }
}
