import 'dart:convert';

import 'package:default_project/screens/data/moduls/categoriy_info_modul.dart';

import '../moduls/catigori_modul.dart';
import '../moduls/network_response.dart';
import 'package:http/http.dart' as http;

class ApiPreovider {
  static Future<NetworRespons> fitchAllProduct() async {
    http.Response response;
    NetworRespons networRespons = NetworRespons();

    try {
      response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/products"));

      if (response.statusCode == 200) {
        networRespons.data = (jsonDecode(response.body)["data"] as List?)
                ?.map((e) => CategoryInfoModul.fromJson(e))
                .toList() ??
            [];
      } else {
        networRespons.errorText = "Else gakirdi";
      }
    } catch (error) {
      networRespons.errorText = "Error";
    }

    return networRespons;
  }

  static Future<NetworRespons> fitchCategory(int id) async {
    http.Response response;
    NetworRespons networRespons = NetworRespons();

    try {
      response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/categories/$id"));
      if (response.statusCode == 200) {
        networRespons.data = (jsonDecode(response.body) as List?)
                ?.map((e) => CategoryInfoModul.fromJson(e))
                .toList() ??
            [];
      } else {
        networRespons.errorText = "Erroe :(";
      }
    } catch (error) {
      networRespons.errorText = "Error ku :)";
    }

    return networRespons;
  }

  static Future<NetworRespons> fitchCategorys() async {
    http.Response response;
    NetworRespons networRespons = NetworRespons();

    try {
      response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/categories"));

      if (response.statusCode == 200) {
        networRespons.data = (jsonDecode(response.body) as List?)
                ?.map((e) => CatigoriyModul.fromJson(e))
                .toList() ??
            [];
      } else {
        networRespons.errorText = "Erroe :(";
      }
    } catch (error) {
      networRespons.errorText = "Error";
    }
    return networRespons;
  }
}
