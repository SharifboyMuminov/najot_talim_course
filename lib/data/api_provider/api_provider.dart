import 'dart:convert';
import 'package:default_project/data/api_provider/api_clint.dart';
import 'package:default_project/data/models/card/card_model.dart';
import 'package:default_project/data/models/my_respons/my_respons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

String token = "-HiR8E4726kmzBbUClaexQdoTKoWNkoiauJUOvbUrj3940KWSQ";

class ApiProvider extends ApiClient {
  Future<MyResponse> callCards() async {
    MyResponse myResponse = MyResponse();
    try {
      Response response = await dio.get(
        "/api/v1/products",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        myResponse.data = (response.data["items"] as List?)
                ?.map((e) => CardModel.fromJson(e))
                .toList() ??
            [];
        debugPrint(myResponse.data.toString());
      }
    } catch (_) {
      debugPrint("asdfasd");
    }
    // debugPrint(myResponse.data.toString());

    return myResponse;
  }

  Future<MyResponse> updateCards({required List<CardModel> cardModel}) async {
    MyResponse myResponse = MyResponse();
    try {
      Response response = await dio.put(
        data: jsonEncode([
          cardModel[0].toJsonForUpdate(),
          cardModel[1].toJsonForUpdate(),
        ]),
        "/api/v1/products",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        myResponse.data = "Query oky";
      }
    } catch (_) {
      debugPrint(_.toString());
      myResponse.errorText = "catch (_)";
    }
    return myResponse;
  }

  Future<MyResponse> insertCards({required CardModel cardModel}) async {
    MyResponse myResponse = MyResponse();
    try {
      Response response = await dio.post(
        data: jsonEncode([cardModel.toJson()]),
        "/api/v1/products",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        myResponse.data = "Query oky";
      }
    } catch (_) {
      debugPrint(_.toString());
      myResponse.errorText = "catch (_)";
    }
    return myResponse;
  }

  Future<MyResponse> deleteCards({required CardModel cardModel}) async {
    MyResponse myResponse = MyResponse();
    try {
      Response response = await dio.delete(
        data: jsonEncode([
          {"_uuid": cardModel.uuid}
        ]),
        "/api/v1/products",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        myResponse.data = "Query oky";
      }
    } catch (_) {
      debugPrint(_.toString());
      myResponse.errorText = "catch (_)";
    }
    return myResponse;
  }
}
