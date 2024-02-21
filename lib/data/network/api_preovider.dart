import 'dart:convert';

import 'package:default_project/data/moduls/compyuter_modul/compyuter_modul.dart';

import '../moduls/network_response.dart';
import 'package:http/http.dart' as http;

class ApiPreovider {
  static Future<NetworkResponse> fitchAll() async {
    http.Response response;
    NetworkResponse networkResponse = NetworkResponse();
    try {
      response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/products"));

      if (response.statusCode == 200) {
        print("Hello");
        networkResponse.data = (jsonDecode(response.body)["data"] as List?)
                ?.map((e) => CompyuterModel.fromJson(e))
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
