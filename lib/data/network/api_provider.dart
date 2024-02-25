import 'dart:convert';

import 'package:default_project/data/models/city/city_modul.dart';
import 'package:http/http.dart' as http;

import '../models/network_response.dart';
import '../models/one_call/one_call_models/one_call_data_models.dart';

class ApiProvider {
  static Future<NetworkResponse> getSimpleWeatherInfo(String city) async {
    NetworkResponse networkResponse = NetworkResponse();
    Map<String, String> queryParams = {
      "appid": "139d82d53b7f20c0a44c1bc27377f9ff",
      "q": city,
    };

    Uri uri = Uri.https(
      "api.openweathermap.org",
      "/data/2.5/weather",
      queryParams,
    );

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        networkResponse.data = CityModul.fromJson(jsonDecode(response.body));
      } else {
        networkResponse.errorText = "else";
      }
    } catch (error) {
      networkResponse.errorText = "Catch Error";
    }

    return networkResponse;
  }

  static Future<NetworkResponse> getComplexWeatherInfo() async {
    NetworkResponse networkResponse = NetworkResponse();
    Map<String, String> queryParams = {
      "lat": "41.2646",
      "lon": "69.2163",
      "units": "metric",
      "exclude": "minutely,current",
      "appid": "4a8eaf9ed512f638cdd7a82434895402",
    };

    Uri uri = Uri.https(
      "api.openweathermap.org",
      "/data/2.5/onecall",
      queryParams,
    );

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        networkResponse.data = OneCallDataModels.fromJson(data);
      } else {
        networkResponse.errorText = "Internetda hatolik :(";
      }
    } catch (error) {
      print("Error");

      networkResponse.errorText = "$error";
    }

    return networkResponse;
  }
}
