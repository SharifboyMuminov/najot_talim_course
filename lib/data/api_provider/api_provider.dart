import 'dart:convert';
import 'dart:io';
import 'package:default_project/data/models/bank/bank_model.dart';
import 'package:default_project/data/models/my_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<MyResponse> getAllDate() async {
    MyResponse myResponse = MyResponse();

    try {
      http.Response response = await http.get(Uri.parse(
          "https://banking-api.free.mockoapp.net/transactions-incomes"));

      if (response.statusCode == HttpStatus.ok) {
        // debugPrint("Data: ${response.body}");
        List<List<BankModel>> data = (jsonDecode(response.body) as List?)
                ?.map((el) =>
                    (el["data"] as List?)
                        ?.map((e) => BankModel.fromJson(e))
                        .toList() ??
                    [])
                .toList() ??
            [];
        List<BankModel> ban = [];
        for (var element in data) {
          ban.addAll(element);
        }
        myResponse.data = ban;
      }
    } catch (_) {
      myResponse.errorText = "Error Catch :(";
    }

    return myResponse;
  }
}
