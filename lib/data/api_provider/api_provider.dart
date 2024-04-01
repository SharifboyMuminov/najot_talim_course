import 'dart:convert';
import 'dart:io';

import 'package:default_project/data/models/country/country.dart';
import 'package:default_project/data/models/my_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<MyResponse> callAllCountry() async {
    MyResponse myResponse = MyResponse();

    try {
      http.Response response = await http
          .get(Uri.parse("https://all-countries.free.mockoapp.net/countries"));

      if (response.statusCode == HttpStatus.ok) {
        // debugPrint("data: ${response.body}");
        myResponse.data =
            (jsonDecode(response.body)["data"]["countries"] as List?)
                    ?.map((value) => CountryModel.fromJson(value))
                    .toList() ??
                [];
      }
    } catch (_) {
      myResponse.errorText = "Error Catch :(";
    }

    return myResponse;
  }
}
