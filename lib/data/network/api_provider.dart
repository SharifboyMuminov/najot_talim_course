import 'dart:convert';

import 'package:default_project/data/models/currency/currency_model.dart';
import 'package:default_project/data/models/network_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<NetworkResponse> getCurrency() async {
    NetworkResponse networkResponse = NetworkResponse();

    http.Response response;

    try {
      response =
          await http.get(Uri.parse("https://nbu.uz/en/exchange-rates/json/"));

      if (response.statusCode == 200) {
        // debugPrint(response.body.toString());
        networkResponse.data = (jsonDecode(response.body) as List?)
                ?.map((e) => CurrencyModel.fromJson(e))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "Api";
      }
    } catch (error) {
      networkResponse.errorText = "Error :(";
    }

    return networkResponse;
  }
}
