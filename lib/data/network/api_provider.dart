import 'package:default_project/data/models/categoriy/categori_model.dart';

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
        networkResponse.data = (response.body as List?)
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
}
